class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :category
      t.integer :price
      t.integer :stock
      t.integer :code
      t.string :trademark

      t.timestamps null: false
    end
  end
end
