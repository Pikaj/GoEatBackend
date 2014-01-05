class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.float :rating
      t.integer :number_raings
      t.references :city, index: true
      t.references :owner, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
