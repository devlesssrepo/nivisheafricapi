class ProductDetailResource < JSONAPI::Resource 
  attributes :id, :size, :colour
  has_one    :product 
end