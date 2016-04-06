json.array!(@customers) do |customer|
  json.extract! customer, :id
  json.extract! customer, :first_name
  json.extract! customer, :last_name
  json.extract! customer, :email_address
  json.extract! customer, :phone_number
  json.extract! customer, :shipping_address
  json.url customer_url(customer, format: :json)
end