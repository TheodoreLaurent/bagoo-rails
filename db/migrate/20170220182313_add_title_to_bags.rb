class AddTitleToBags < ActiveRecord::Migration[5.0]
  def change
    add_column :bags, :title, :string
  end
end
