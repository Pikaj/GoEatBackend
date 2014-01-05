class CreateElementDishCategories < ActiveRecord::Migration
  def change
    create_table :element_dish_categories do |t|
      t.references :dish, index: true
      t.references :DishCategory, index: true

      t.timestamps
    end
  end
end
