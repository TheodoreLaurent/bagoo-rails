class AddReferencesToBags < ActiveRecord::Migration[5.0]
  def change
    add_reference :bags, :user, foreign_key: true
  end
end
