class OrderDetailsController < ApplicationController
  # include JSONAPI::ActAsResourceController
  before_action :set_order_detail, only: [:show, :edit, :update, :destroy]

  def index
    @order_details = OrderDetail.all
  end

  def create
    @order = current_order
    @order_detail = @order.order_details.new(order_detail_params)
    @order.save
    session[:order_id] = @order.id
    flash.now[:alert]= "Item added to bag"
  end

  def update
    @order = current_order
    @order_detail = @order.order_details.find(params[:id])
    @order_detail.update_attributes(order_detail_params)
    @order_details = @order.order_details
    flash.now[:alert]= "Item updated in bag"
  end

  def destroy
    @order = current_order
    @order_detail = @order.order_details.find(params[:id])
    @order_detail.destroy
    @order_details = @order.order_details 
    flash.now[:alert]= "Item removed from bag"
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_detail
      @order_detail = order_detail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_detail_params
      params.require(:order_detail).permit(
        :stock_id,
        :quantity,
        :price,
        :customer_id,
        :price_sum
      )
    end
end
