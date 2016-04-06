class OrderDetailResource < JSONAPI::Resource 
  attributes :id, :order_id, :product_id, :unit_price, :quantity, :price_sum, :colour, :size
  has_one  :order 
end