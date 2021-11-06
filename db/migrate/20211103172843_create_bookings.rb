class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.date :arrival
      t.date :departure

      t.timestamps
    end
  end
end
