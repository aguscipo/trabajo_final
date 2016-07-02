class CreateTrademarks < ActiveRecord::Migration
  def change
    create_table :trademarks do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
