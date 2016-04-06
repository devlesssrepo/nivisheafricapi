class ProductResource < JSONAPI::Resource 
  attributes :id, :label, :description, :code, :unit_price, :pictures, :is_featured, :is_available, :category_id, :collection_id
  has_many   :product_details
  has_many   :order_details
  has_one    :collection
  has_one    :category
end  