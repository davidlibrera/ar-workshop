class CreateBuildings < ActiveRecord::Migration[5.1]
  def change
    create_table :buildings do |t|
      t.string :address
      t.integer :rooms

      t.timestamps
    end
  end
end
