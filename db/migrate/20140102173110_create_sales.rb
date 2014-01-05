class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :date_from
      t.string :date_to
      t.text :description
      t.references :restaurant, index: true

      t.timestamps
    end
  end
end
