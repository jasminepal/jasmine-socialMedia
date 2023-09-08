class AddImageAndVideoToSocios < ActiveRecord::Migration[7.0]
  def change
    add_column :socios, :image, :string
    add_column :socios, :video, :string
  end
end
