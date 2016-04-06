json.data @countries do |country|
  json.country_id country.id
  json.country_name country.name
  json.country_code country.code
  json.url country_url(country, format: :json)
end