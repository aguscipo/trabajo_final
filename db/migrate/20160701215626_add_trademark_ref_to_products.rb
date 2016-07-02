class AddTrademarkRefToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :trademark, index: true, foreign_key: true
  end
end
