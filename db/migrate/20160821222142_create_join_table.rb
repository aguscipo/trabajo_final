class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :payments, :products do |t|
       t.index [:payment_id, :product_id]
       t.index [:product_id, :payment_id]
    end
  end
end
