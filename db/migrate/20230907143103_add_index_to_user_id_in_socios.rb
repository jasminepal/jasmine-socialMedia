class AddIndexToUserIdInSocios < ActiveRecord::Migration[7.0]
  def change
    add_index :socios, :user_id
  end
end
