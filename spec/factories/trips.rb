FactoryBot.define do
  factory :trip do
    start_location { "MyString" }
    end_location { "MyString" }
    trip_duration { "MyString" }
    time_of_trip { "2024-03-22 09:49:41" }
    user { nil }
  end
end
