class AddRefrenceToBooking < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :passenger , foreign_key: {to_table: :passengers}
    add_reference :bookings, :flight , foreign_key: {to_table: :flights}
  end
end
