class Product < ApplicationRecord
  mount_uploaders :pictures, PictureUploader

  belongs_to :collection
  belongs_to :category
  has_many   :product_details
  has_many   :order_details
  
  validates :label, :presence => true
  validates :code, :presence => true
  validates :unit_price,  :presence => true
  validates :pictures, :presence => true

  default_scope { where(is_available: true) }

end