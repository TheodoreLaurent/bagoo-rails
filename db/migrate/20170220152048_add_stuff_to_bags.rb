class AddStuffToBags < ActiveRecord::Migration[5.0]
  def change
    add_column :bags, :category, :string
    add_column :bags, :brand, :string
    add_column :bags, :capacity, :integer
    add_column :bags, :price_per_day, :float
    add_column :bags, :description, :text
  end
end
