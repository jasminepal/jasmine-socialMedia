class AddAttributesToSocios < ActiveRecord::Migration[7.0]
  def change
    add_column :socios, :title, :string
    add_column :socios, :description, :text
  end
end
