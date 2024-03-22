require "rails_helper"

RSpec.describe "trip endpoints", type: :request do
  describe "POST /trips" do
    before :each do
      @user = FactoryBot.create(:user)
    end
    it "creates a new trip" do
      post "/api/v1/trips", params: {
        trip: {
          start_location: { latitude: 10, longitude: 10 },
          end_location: { latitude: 11, longitude: 13 },
          trip_duration: 10200,
          time_of_trip: Time.now,
          user_id: @user.id
        }
      }

    end
  end
end
