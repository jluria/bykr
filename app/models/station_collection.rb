class StationCollection
  include HTTParty
  base_uri "http://www.citibikenyc.com"

  def self.update_from_citibike_api
    new.all
  end

  def all
    json = self.class.get("/stations/json")
    station_list = json["stationBeanList"]
    station_list.each do |s|
      station = Station.create(address: s["stAddress1"],
                               latitude: s["latitude"],
                               longitude: s["longitude"],
                               bikes: s["availableBikes"],
                               free_docks: s["availableDocks"]
                              )
    end
  end
end
