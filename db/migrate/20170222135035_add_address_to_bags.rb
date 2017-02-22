class AddAddressToBags < ActiveRecord::Migration[5.0]
  def change
    add_column :bags, :address, :string
  end
end
