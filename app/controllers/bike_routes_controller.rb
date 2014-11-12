class BikeRoutesController < ApplicationController
  def show
    @start_location = Location.find(params[:start_location])
    @end_location = Location.find(params[:end_location])
    @starting_stations = qualify_start_stations(@start_location)
    @ending_stations = qualify_end_stations(@end_location)

   # qualify_stations(@starting_stations, @start_location, @ending_stations, @end_location)
  end

  private

=begin
  def qualify_stations(start_station_collection, start_location, end_station_collection, end_location)
    Station.all.each do |station|
      if qualifying_start_station?(station, start_location)
        start_station_collection << station
      elsif qualifying_end_station?(station, end_location)
        end_station_collection << station
      end
    end
  end
=end

  def qualify_start_stations(start_location)
    collection = []
    Station.all.each do |station|
      if close_enough?(station, start_location) && enough_bikes?(station)
        collection << station
      end
    end
    return collection
  end

  def qualify_end_stations(end_location)
    collection = []
    Station.all.each do |station|
      if close_enough?(station, end_location) && enough_docks?(station)
        collection << station
      end
    end
    return collection
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
