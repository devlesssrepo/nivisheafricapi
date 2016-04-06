json.array!(@products) do |product|
  json.extract! product, :id
  json.extract! product, :category_id
  json.extract! product, :collection_id
  json.extract! product, :label
  json.extract! product, :description
  json.extract! product, :code
  json.extract! product, :unit_price
  json.extract! product, :size_id
  json.extract! product, :colour_id
  json.extract! product, :is_available
  json.extract! product, :pictures
  json.url product_url(product, format: :json)
end