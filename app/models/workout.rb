class Workout < ActiveRecord::Base
  validates :date_time, presence: true
  validates :activity, presence: true

  geocoded_by :address
  after_validation :geocode
end
