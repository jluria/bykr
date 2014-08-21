class StationsController < ApplicationController
  def index
    @stations = Station.new.all
  end
end
