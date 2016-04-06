class CustomerResource < JSONAPI::Resource
  attributes :id, :first_name, :last_name, :email_address, :phone_number, :password, :password_confirmation, :shipping_address, :country_id

  has_one  :country
end