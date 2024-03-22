require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:start_location) }
    it { should validate_presence_of(:end_location) }
    it { should validate_presence_of(:trip_duration) }
    it { should validate_presence_of(:time_of_trip) }
  end
end
