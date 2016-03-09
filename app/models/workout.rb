class Workout < ActiveRecord::Base
  validates :date_time, presence: true
  validates :activity, presence: true
end
