class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.integer :duration
      t.date :departure_date
      t.time :departure_time
      t.timestamps
    end
  end
end
