class Admin::DonatorsController < ApplicationController
  before_action :set_admin_donator, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate

  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == 'admin' && password == 'password'
    end
  end

  # GET /admin/donators
  # GET /admin/donators.json
  def index
    @donators = Donator.all
  end

  # GET /admin/donators/1
  # GET /admin/donators/1.json
  def show
  end

  # GET /admin/donators/new
  def new
    @admin_donator = Donator.new
  end

  # GET /admin/donators/1/edit
  def edit
  end

  # POST /admin/donators
  # POST /admin/donators.json
  def create
    @admin_donator = Donator.new(admin_donator_params)

    respond_to do |format|
      if @admin_donator.save
        format.html { redirect_to @admin_donator, notice: 'Donator was successfully created.' }
        format.json { render :show, status: :created, location: @admin_donator }
      else
        format.html { render :new }
        format.json { render json: @admin_donator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/donators/1
  # PATCH/PUT /admin/donators/1.json
  def update
    respond_to do |format|
      if @admin_donator.update(admin_donator_params)
        format.html { redirect_to admin_donator_url, notice: 'Donator was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_donator }
      else
        format.html { render :edit }
        format.json { render json: @admin_donator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/donators/1
  # DELETE /admin/donators/1.json
  def destroy
    @admin_donator.destroy
    respond_to do |format|
      format.html { redirect_to admin_donators_url, notice: 'Donator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_donator
      @admin_donator = Donator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_donator_params
      params.require(:donator).permit(:name, :pledge, :email, :phone, :message, :anonymous)
    end
end
