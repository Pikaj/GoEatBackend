class CreateRestaurantCategories < ActiveRecord::Migration
  def change
    create_table :restaurant_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
