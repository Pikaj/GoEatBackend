class CreateElementRestaurantCategories < ActiveRecord::Migration
  def change
    create_table :element_restaurant_categories do |t|
      t.references :restaurant, index: true
      t.references :RestaurantCategory, index: true

      t.timestamps
    end
  end
end
