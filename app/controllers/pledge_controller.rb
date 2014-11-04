class PledgeController < ApplicationController

  def index
    donator_list
    @pledge = Donator.new
  end

  def create
  	@pledge = Donator.new(safe_params)
    if @pledge.save
      if params[:direct].blank?
        redirect_to :pledge, flash: { notice:  "Pledge success"}
      else
        redirect_to :pledge, flash: { success: "direct" }
      end
    else
      donator_list
      render action: :index
    end
  end

private

  def safe_params
    params[:fm].permit(:name, :pledge, :email, :phone, :message, :anonymous)
  end

  def donator_list
    @data = Donator.order(created_at: :desc)
    @data.each do |d|
      d.name = "Anonymous" if d.anonymous
    end
  end

end
