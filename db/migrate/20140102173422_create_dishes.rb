class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.float :price
      t.references :menu, index: true
      t.references :sale, index: true

      t.timestamps
    end
  end
end
