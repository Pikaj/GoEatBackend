class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :coordinates
      t.references :restaurant, index: true

      t.timestamps
    end
  end
end
