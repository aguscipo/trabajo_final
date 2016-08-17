class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :email
      t.string :card_number
      t.string :security_code
      t.string :expiration_month
      t.string :expiration_year
      t.string :card_holder
      t.string :doc_type
      t.string :doc_number

      t.timestamps null: false
    end
  end
end
