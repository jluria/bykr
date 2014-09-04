class StationCollection
  include HTTParty
  base_uri "http://www.citibikenyc.com"

  def self.all
    new.all
  end

  def all
    json = self.class.get("/stations/json")
    station_list = json["stationBeanList"]
    station_list.each do |s|
      station = Station.new
      station.address = s["stAddress1"]
      station.save
    end
  end
end
