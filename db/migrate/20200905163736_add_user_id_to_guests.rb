class AddUserIdToGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :user_id, :integer
  end
end
