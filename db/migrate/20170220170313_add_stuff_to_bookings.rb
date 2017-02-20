class AddStuffToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :check_in, :date
    add_column :bookings, :check_out, :date
    add_column :bookings, :total_price, :float
    add_column :bookings, :rating, :float
    add_column :bookings, :content, :text
  end
end
