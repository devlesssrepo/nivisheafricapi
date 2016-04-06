class Collection < ApplicationRecord
  belongs_to :designer
  has_many   :products

  validates  :name, presence:true 
end