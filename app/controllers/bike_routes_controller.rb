class BikeRoutesController < ApplicationController
  def show
    @start_location = Location.find(params[:start_location])
    @end_location = Location.find(params[:end_location])

    @starting_stations = []
    qualify_starting_stations(@starting_stations, @start_location)

    @ending_stations = []
    qualify_ending_stations(@ending_stations, @end_location)
  end

  private

  def qualify_starting_stations(station_collection, location)
    stations = Station.all
    stations.each do |station|
      if location.distance_to(station) <= current_user.max_distance_to_station && station.bikes >= current_user.min_bikes_at_station
        station_collection << station
      end
    end
  end

  def qualify_ending_stations(station_collection, location)
    stations = Station.all
    stations.each do |station|
      if station.free_docks >= current_user.min_free_bike_docks && location.distance_to(station) <= current_user.max_distance_to_station
        station_collection << station
      end
    end
  end
end
