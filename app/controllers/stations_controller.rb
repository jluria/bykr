class StationsController < ApplicationController
  JSON_FEED = "http://www.citibikenyc.com/stations/json"

  def index
    json = HTTParty.get(JSON_FEED)
    @stations = json["stationBeanList"]
  end
end
