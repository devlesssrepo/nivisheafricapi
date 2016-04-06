class Order < ApplicationRecord
  enum status: [ :cancelled, :in_progress, :completed, :paid]

  has_many :order_details
  has_many :payments
  before_create :set_status
  before_save :update_subtotal

  def subtotal
    order_details.collect{ |oi| oi.valid? ? (oi.quantity * oi.price) : 0 }.sum
  end

  private
  def set_status
    self.status = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end