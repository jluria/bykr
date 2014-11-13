class BikeRoutesController < ApplicationController
  def show
    @start_location = Location.find(params[:start_location])
    @end_location = Location.find(params[:end_location])
    @starting_stations = acceptable_start_stations(@start_location)
    @ending_stations = acceptable_end_stations(@end_location)
  end

  private

  def acceptable_start_stations(start_location)
    Station.all.select { |station| qualifying_start_station?(station, start_location) }
  end

  def acceptable_end_stations(end_location)
    Station.all.select { |station| qualifying_end_station?(station, end_location) }
  end

  def qualifying_start_station?(station, start_location)
    close_enough?(station, start_location) && enough_bikes?(station)
  end

  def qualifying_end_station?(station, end_location)
    close_enough?(station, end_location) && enough_docks?(station)
  end

  def close_enough?(station, location)
    location.distance_to(station) <= current_user.max_distance_to_station
  end

  def enough_bikes?(station)
    station.bikes >= current_user.min_bikes_at_station
  end

  def enough_docks?(station)
    station.free_docks >= current_user.min_free_bike_docks
  end
end
