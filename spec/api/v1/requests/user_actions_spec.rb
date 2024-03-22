require "rails_helper"

RSpec.describe "user endpoints", type: :request do
  describe "POST /users" do
    it "creates a new user" do
      post "/api/v1/users", params: {
        user: {
          first_name: "John",
          last_name: "Doe",
          email: "whatever@whatever.net"
        }
      }

      expect(response).to have_http_status(:created)

      json_response = JSON.parse(response.body)

      expect(json_response["first_name"]).to eq("John")
      expect(User.last.email).to eq("whatever@whatever.net")
    end

    it "fails to create a new user" do
      post "/api/v1/users", params: {
        user: {
          first_name: "",
          last_name: "",
          email: ""
        }
      }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
