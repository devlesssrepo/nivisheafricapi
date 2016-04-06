class PaymentResource < JSONAPI::Resource
  attributes :id, :order_id, :customer_token, :amount_paid, :amount_owed

  has_one :order
end