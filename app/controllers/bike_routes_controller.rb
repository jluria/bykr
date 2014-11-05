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
    Station.all.each do |station|
      if qualifying_start_station?(station, start_location)
        start_station_collection << station
      elsif qualifying_end_station?(station, end_location)
        end_station_collection << station
      end
    end
  end

  def qualifying_start_station?(station, location)
    location.distance_to(station) <= current_user.max_distance_to_station && station.bikes >= current_user.min_bikes_at_station
  end

  def qualifying_end_station?(station, location)
    station.free_docks >= current_user.min_free_bike_docks && location.distance_to(station) <= current_user.max_distance_to_station
  end
end
