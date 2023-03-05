class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order
  before_action :set_item

  def index
    @order_delivery_address = OrderDeliveryAddress.new
    if current_user == @item.user
      redirect_to root_path
    end
  end


  def create
    @order_delivery_address = OrderDeliveryAddress.new(order_params)
    if @order_delivery_address.valid?
     pay_item
       @order_delivery_address.save
       redirect_to root_path 
    else
       render :index
    end
  end

  private

  def order_params
    params.require(:order_delivery_address).permit(:postal_code, :delivery_area_id, :city, :block, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @item.item_price, 
    card: order_params[:token],    
    currency: 'jpy'               
  )
  end

 def set_order
  @item = Item.find(params[:item_id])
  if @item.order.present?
   redirect_to root_path 
  end
 end

 def set_item
  @item = Item.find(params[:item_id])
 end

end

