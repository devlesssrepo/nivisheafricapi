json.array!(@order_details) do |order_detail|
  json.extract! order_detail, :id
  json.extract! order_detail, :order_id
  json.extract! order_detail, :product_id
  json.extract! order_detail, :unit_price
  json.extract! order_detail, :quantity
  json.extract! order_detail, :price_sum
  json.extract! order_detail, :size
  json.extract! order_detail, :colour
  json.url order_detail_url(order_detail, format: :json)
end