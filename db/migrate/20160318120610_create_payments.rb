class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer  :order_id
      t.string   :customer_token
      t.decimal  :amount_paid, precision:11, scale:2
      t.decimal  :amount_owed, precision:11, scale:2
      
      t.timestamps
    end
  end
end
