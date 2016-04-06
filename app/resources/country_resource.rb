class CountryResource < JSONAPI::Resource
  attributes :name, :code
  has_many :designers
  has_many :customers
end