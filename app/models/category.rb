class Category < ApplicationRecord
  enum segment: [ :unisex, :women, :men ]
end
