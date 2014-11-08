class Admin::DonorsController < ApplicationController
  before_action :authenticate
  before_action :set_donor, only: [:edit, :update, :destroy]

  def index
    @donors = Donor.newest_first
  end

  def edit
  end

  def update
    if @donor.update(donor_params)
      redirect_to admin_donors_path, notice: 'Donor was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @donor.destroy
    redirect_to admin_donors_path, notice: 'Donor was successfully destroyed.'
  end

  private
    def authenticate
      authenticate_or_request_with_http_basic('Letdoit') do |username, password|
        username == ENV['USERNAME'] && password == ENV['PASSWORD']
      end
    end

    def set_donor
      @donor = Donor.find(params[:id])
    end

    def donor_params
      params.require(:donor).permit(:name, :pledge, :email, :phone, :message, :anonymous)
    end
end
