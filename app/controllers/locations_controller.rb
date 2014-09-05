class LocationsController < ApplicationController
  before_filter :require_login

  def new
    @location = Location.new
  end

  def create
    current_user.locations.create(location_params)
    redirect_to dashboard_path
  end

  private

  def location_params
    params.require(:location).permit(:name, :address, :city, :state, :zip)
  end
end
