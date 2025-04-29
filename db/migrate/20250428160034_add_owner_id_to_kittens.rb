class AddOwnerIdToKittens < ActiveRecord::Migration[8.0]
  def change
    add_column :kittens, :owner_id, :integer
  end
end
