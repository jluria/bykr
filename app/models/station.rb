class Station
  attr_reader :name

  def initialize(attrs)
    @name = attrs["stationName"]
  end

  def self.all
    StationGateway.new.all
  end
end
