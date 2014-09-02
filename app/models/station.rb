class Station
  attr_reader :name, :id

  def initialize(attrs)
    @name = attrs["stationName"]
    @id = attrs["id"]
  end
end
