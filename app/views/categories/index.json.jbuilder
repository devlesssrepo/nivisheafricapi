json.array!(@categories) do |category|
  json.extract! category, :id
  json.extract! category, :keyword
  json.url category_url(category, format: :json)
end