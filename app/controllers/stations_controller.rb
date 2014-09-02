class StationsController < ApplicationController
  def index
    @stations = StationCollection.all
  end

  def show
    stations = StationCollection.all
    stations.each do |station|
      if station.id == params[:id]
        @station = station
        break
      end
    end
    raise @station.inspect
  end
end
