require "rails_helper"

RSpec.describe "trip endpoints", type: :request do
  describe "POST /trips" do
    before :each do
      @user = FactoryBot.create(:user)
    end

    it "creates a new trip" do
      post "/api/v1/trips", params: {
        trip: {
          start_location: "10, 10",
          end_location: "11, 13",
          trip_duration: 10200,
          time_of_trip: Time.now,
          user_id: @user.id
        }
      }

      expect(response).to have_http_status(201)

      json_response = JSON.parse(response.body)

      expect(json_response["data"]["attributes"]["start_location"]).to eq("10, 10")
      expect(json_response["data"]["attributes"]["end_location"]).to eq("11, 13")
      expect(json_response["data"]["attributes"]["trip_duration"]).to eq("10200")
    end

    it "fails to create a new trip with invalid params" do
      post "/api/v1/trips", params: {
        trip: {
          start_location: "",
          end_location: "",
          trip_duration: 12,
          time_of_trip: Time.now,
          user_id: @user.id
        }
      }

      expect(response).to have_http_status(422)
    end
  end
end
