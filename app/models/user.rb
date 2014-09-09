class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  before_create :set_defaults

  has_many :locations, dependent: :destroy

  private

  def set_defaults
    self.max_distance_to_station = 0.5
    self.min_bikes_at_station = 5
    self.min_free_bike_docks = 8
  end
end
