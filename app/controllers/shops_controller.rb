class ShopsController < ApplicationController

  def index
    if params[:search]
      @shops = Product.search(params[:search])
    else
      @shops = Product.all
    end
  end

  def show
    @shop = Product.find(params[:id])
    @cart_order = current_order.order_details.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_params
      params.require(:shop).permit(
        :search
        )
    end
end