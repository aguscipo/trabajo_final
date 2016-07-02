class RemoveTrademarkFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :trademark, :string
  end
end
