class Trip < ApplicationRecord
  belongs_to :user

  validates :start_location, presence: true
  validates :end_location, presence: true
  validates :trip_duration, presence: true
  validates :time_of_trip, presence: true
end
