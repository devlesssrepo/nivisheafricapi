class CollectionResource < JSONAPI::Resource
  attributes :id, :name, :designer_id
  has_one  :designer 
  has_many :products
end