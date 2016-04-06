class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer  :customer_id
      t.integer  :quantity_total, default:0
      t.decimal  :subtotal, precision: 11, scale: 2, null:false
      t.decimal  :shipping_cost, precision: 11, scale: 2, default:0.00
      t.integer  :status, default:1
      t.integer  :payment_id
      t.datetime :expected_del_date
      t.datetime :dispatch_date
      t.integer  :courier_id

      t.timestamps
    end
  end
end
