class ChargesController < ApplicationController

  def create
    #Amount in cents
    @amount = current_order.subtotal.to_i
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source => params[:stripeToken]
      )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount*100,
      :description => 'Nivishe Africa stripe customer',
      :currency => 'usd'
      )
    paid_order

  rescue Stripe::CardError => e
    # flash[:error] = e.message
    # redirect_to new_charge_path
    render json: e.message, status: :unprocessable_entity
  end
end