class Station
  attr_reader :name

  def initialize(attrs)
    @name = attrs["stationName"]
  end

  def self.all
    StationCollection.new.all
  end
end
