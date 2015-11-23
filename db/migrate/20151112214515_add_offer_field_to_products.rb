class AddOfferFieldToProducts < ActiveRecord::Migration
  def change
    add_column :products, :offer, :boolean
    add_column :products, :cover_picture, :string
  end
end
