class StationGateway
  include HTTParty
  base_uri "http://www.citibikenyc.com"

  def all
    json = self.class.get("/stations/json")
    station_list = json["stationBeanList"]
  end
end
