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
    @item = Item.find(params[:item_id])
    if @order_shipping_info.valid?
      pay_item
      @order_shipping_info.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_shipping_info).permit(:zip_code, :prefecture_id, :city, :address, :building, :order_id, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.item_price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

end