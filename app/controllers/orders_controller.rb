class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
   @order_shipping_info = OrderShippingInfo.new
   @item = Item.find(params[:item_id])
  end

  def new
    @order_shipping_info = OrderShippingInfo.new
  end
  
  def create
    @order_shipping_info = OrderShippingInfo.new(order_params)
    if @order_shipping_info.valid?
      @order_shipping_info.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_shipping_info).permit(:zip_code, :prefecture_id, :city, :address, :building, :order_id, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end