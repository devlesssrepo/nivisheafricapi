json.array!(@designers) do |designer|
  json.extract! designer, :id
  json.extract! designer, :design_label
  json.extract! designer, :first_name
  json.extract! designer, :last_name
  json.extract! designer, :email_address
  json.extract! designer, :phone_number
  json.extract! designer, :logo
  json.extract! designer, :about_notes
  json.extract! designer, :physical_address
  json.url designer_url(designer, format: :json)
end