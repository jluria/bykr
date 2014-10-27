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
      qualify_start_station(station, start_location, start_station_collection)
      qualify_end_station(station, end_location, end_station_collection)
    end
  end

  def qualify_start_station(station, location, station_collection)
    if location.distance_to(station) <= current_user.max_distance_to_station && station.bikes >= current_user.min_bikes_at_station
      station_collection << station
    end
  end

  def qualify_end_station(station, location, station_collection)
    if station.free_docks >= current_user.min_free_bike_docks && location.distance_to(station) <= current_user.max_distance_to_station
      station_collection << station
    end
  end
end
