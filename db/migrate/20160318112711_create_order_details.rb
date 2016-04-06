class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|
      t.integer  :order_id
      t.integer  :product_id
      t.decimal  :unit_price, precision:6, scale:2
      t.integer  :quantity
      t.decimal  :price_sum, precision:11, scale:2
      t.string   :size
      t.string   :colour
      
      t.timestamps
    end
  end
end
