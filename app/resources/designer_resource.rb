class DesignerResource < JSONAPI::Resource
  attributes :id, :design_label, :first_name, :last_name, :phone_number, :email_address, :password, :physical_address, :country_id, :about_notes, :logo
  has_one  :country
  has_many :collections
end