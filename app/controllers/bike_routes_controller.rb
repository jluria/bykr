class BikeRoutesController < ApplicationController
  def show
    @start_location = Location.find(params[:start_location])
    @end_location = Location.find(params[:end_location])
    @qualifying_stations = []
    qualify_stations(@qualifying_stations)
    end
  end

  private

  def qualify_stations(station_collection)
    stations = Station.all
    stations.each do |station|
      if @start_location.distance_to(station) <= current_user.max_distance_to_station && station.bikes >= current_user.min_bikes_at_station
        station_collection << station
      end
    end
end
