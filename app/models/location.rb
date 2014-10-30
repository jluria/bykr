class Location < ActiveRecord::Base
  belongs_to :user
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    "#{address} #{city} #{state} #{zip}"
  end
end
