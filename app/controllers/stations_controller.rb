class StationsController < ApplicationController
  include HTTParty
  base_uri "http://localhost:3000"

  def index
    json = HTTParty.get("http://www.citibikenyc.com/stations/json")
    @stations = json["stationBeanList"]
  end
end
