class AddCostToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :cost, :integer
  end
end
