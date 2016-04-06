class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity_total, presence: true, numericality: {only_integer: true, greater_than: 0}
  validate  :product_present
  validate  :order_present

  before_save :complete_order

  def price
    if persisted? 
      self[:unit_price]
    else
      product.unit_price
    end
  end

  def price_sum
    price * quantity
  end

  private
  def product_present
    if product.nil?
      errors.add(:product, "is currently sold out")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a cart")
    end
  end

  def complete_order
    self[:unit_price] = price
    self[:price_sum] = quantity * self[:price]
  end
end