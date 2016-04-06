class CartController < ApplicationController

  def show
    respond_with current_order.orders
  end
end