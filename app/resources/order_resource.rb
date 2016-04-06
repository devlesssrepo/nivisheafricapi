class OrderResource < JSONAPI::Resource 
  attributes :quantity_total, :subtotal, :shipping_cost, :status

  has_many :order_details
  has_many :payments
end