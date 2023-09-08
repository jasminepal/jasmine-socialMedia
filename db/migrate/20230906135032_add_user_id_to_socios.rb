class AddUserIdToSocios < ActiveRecord::Migration[7.0]
  def change
    add_column :socios, :user_id, :integer
    add_reference :blog_posts, :user, foreign_key: true
  end
end
