class Station
  attr_reader :name

  def initialize(attrs)
    @name = attrs["stationName"]
  end
end
