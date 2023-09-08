class AddSocioIdToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :socio, null: false, foreign_key: true
  end
end
