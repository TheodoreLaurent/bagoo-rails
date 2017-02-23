class AddBookedDatesToBags < ActiveRecord::Migration[5.0]
  def change
    add_column :bags, :bookeddates, :text, array: true, default: []
  end
end

