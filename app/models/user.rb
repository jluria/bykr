class User < ActiveRecord::Base
  DEFAULT_MAX_DISTANCE_TO_STATION = 0.5
  DEFAULT_MIN_BIKES_AT_STATION = 5
  DEFAULT_MIN_FREE_BIKE_DOCKS = 8

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  before_create :set_defaults

  has_many :locations, dependent: :destroy

  private

  def set_defaults
    self.max_distance_to_station = DEFAULT_MAX_DISTANCE_TO_STATION
    self.min_bikes_at_station = DEFAULT_MIN_BIKES_AT_STATION
    self.min_free_bike_docks = DEFAULT_MIN_FREE_BIKE_DOCKS
  end
end
