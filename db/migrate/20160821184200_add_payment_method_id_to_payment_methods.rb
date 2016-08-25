class AddPaymentMethodIdToPaymentMethods < ActiveRecord::Migration
  def change
    add_column :payment_methods, :payment_method_id, :string
  end
end
