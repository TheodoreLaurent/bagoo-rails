class AddAcceptedToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :accepted, :boolean
  end
end
