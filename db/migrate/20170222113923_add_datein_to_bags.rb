class AddDateinToBags < ActiveRecord::Migration[5.0]
  def change
    add_column :bags, :datein, :date
  end
end
