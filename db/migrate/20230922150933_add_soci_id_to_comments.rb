class AddSociIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :socio, null: false, foreign_key: true
  end
end
