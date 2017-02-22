class AddDateoutToBags < ActiveRecord::Migration[5.0]
  def change
    add_column :bags, :dateout, :date
  end
end
