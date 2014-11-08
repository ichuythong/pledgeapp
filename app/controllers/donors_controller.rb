class DonorsController < ApplicationController
  def index
    @donor = Donor.new
  end

  def create
    @donor = Donor.new(donor_params)
    if @donor.save
      redirect_after_saved
    else
      render :index
    end
  end

private

  def donor_params
    params[:donor].permit(:name, :pledge, :email, :phone, :message, :anonymous)
  end

  def donors
    @donors ||= Donor.newest_first
  end
  helper_method :donors

  def redirect_after_saved
    if params[:direct].present?
      redirect_to donors_path(pledge_direct: true), notice: 'Thank you!'
    else
      redirect_to donors_path, notice: 'Thank you!'
    end
  end
end
