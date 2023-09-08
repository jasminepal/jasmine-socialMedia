class CreateSocios < ActiveRecord::Migration[7.0]
  def change
    create_table :socios do |t|

      t.timestamps
    end
  end
end
