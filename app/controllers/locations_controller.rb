class LocationsController < ApplicationController
  def new
    @location = Location.new
  end

  def create
    location = current_user.locations.new(location_params)
    location.save
    redirect_to dashboard_path
  end

  private

  def location_params
    params.require(:location).permit(:name, :address, :city, :state, :zip)
  end
end
