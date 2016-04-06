class ProductDetail < ApplicationRecord
  belongs_to :product

  validates :size,  :presence => true
  validates :colour,  :presence => true
 
end
