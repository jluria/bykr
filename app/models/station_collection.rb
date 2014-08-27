class StationCollection
  include HTTParty
  base_uri "http://www.citibikenyc.com"

  def all
    json = self.class.get("/stations/json")
    station_list = json["stationBeanList"]
    station_list.map {|station| Station.new(station)}
  end
end
