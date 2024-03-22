class TripSerializer
  include JSONAPI::Serializer
  attributes :start_location, :end_location, :trip_duration, :time_of_trip

  attribute :user_id do |object|
    object.user.id
  end
end
