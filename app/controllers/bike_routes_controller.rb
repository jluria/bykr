class BikeRoutesController < ApplicationController
  def show
    @start_location = Location.find(params[:start_location])
    @end_location = Location.find(params[:end_location])
    @starting_stations = []
    @ending_stations = []

    qualify_stations(@starting_stations, @start_location, @ending_stations, @end_location)
  end

  private

  def qualify_stations(start_station_collection, start_location, end_station_collection, end_location)
    stations = Station.all
    stations.each do |station|
      if start_location.distance_to(station) <= current_user.max_distance_to_station && station.bikes >= current_user.min_bikes_at_station
        start_station_collection << station
      elsif station.free_docks >= current_user.min_free_bike_docks && end_location.distance_to(station) <= current_user.max_distance_to_station
        end_station_collection << station
      end
    end
  end
end
