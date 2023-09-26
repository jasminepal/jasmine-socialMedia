class CreateFolloweds < ActiveRecord::Migration[7.0]
  def change
    create_table :followeds do |t|
      t.references :follower, foreign_key: { to_table: :users }
      t.references :followed, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
