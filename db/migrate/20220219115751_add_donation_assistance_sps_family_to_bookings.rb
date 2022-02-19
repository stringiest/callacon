class AddDonationAssistanceSpsFamilyToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :donation, :integer
    add_column :bookings, :assistance, :boolean
    add_column :bookings, :sps, :boolean
    add_column :bookings, :family, :boolean
  end
end
