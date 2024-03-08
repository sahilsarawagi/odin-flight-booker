class CreatePassengerBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :passenger_bookings do |t|

      t.timestamps
    end
  end
end
