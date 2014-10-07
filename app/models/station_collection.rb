class StationCollection
  include HTTParty
  base_uri "http://www.citibikenyc.com"

  def self.update_from_citibike_api
    new.all
  end

  def all
    json = self.class.get("/stations/json")
    station_list = json["stationBeanList"]
    create_stations(station_list)
  end

  private

  def create_stations(station_list)
    station_list.each do |station|
      Station.create(
        address: station["stAddress1"],
        latitude: station["latitude"],
        longitude: station["longitude"],
        bikes: station["availableBikes"],
        free_docks: station["availableDocks"]
      )
    end
  end
end
