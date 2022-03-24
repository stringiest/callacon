class AddDefaultToDonationInBookings < ActiveRecord::Migration[6.1]
  def change
    change_column_default :bookings, :donation, 0
  end
end
