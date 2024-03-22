class Api::V1::TripsController < ApplicationController
  def create
    user = User.find_by(id: params[:trip][:user_id])
    trip = user.trips.build(trip_params)
    if trip.save
      render json: TripSerializer.new(trip), status: :created
    else
      render json: {error: trip.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:user_id, :start_location, :end_location, :trip_duration, :time_of_trip)
  end
end
