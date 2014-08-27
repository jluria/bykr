class StationsController < ApplicationController
  def index
    @stations = StationCollection.all
  end
end
