class CategoryResource < JSONAPI::Resource 
  attributes :id, :keyword, :segment
  has_many  :products
end