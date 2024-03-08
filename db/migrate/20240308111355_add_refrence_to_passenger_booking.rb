class AddRefrenceToPassengerBooking < ActiveRecord::Migration[7.1]
  def change
    add_reference :passenger_bookings, :passenger , foreign_key: {to_table: :passengers}
    add_reference :passenger_bookings, :booking , foreign_key: {to_table: :bookings}
  end
end
