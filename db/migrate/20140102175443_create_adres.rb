class CreateAdres < ActiveRecord::Migration
  def change
    create_table :adres do |t|
      t.string :street
      t.string :number
      t.string :postal_code
      t.references :location, index: true

      t.timestamps
    end
  end
end
