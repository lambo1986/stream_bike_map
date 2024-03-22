class CreateTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :trips do |t|
      t.string :start_location
      t.string :end_location
      t.string :trip_duration
      t.datetime :time_of_trip
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
