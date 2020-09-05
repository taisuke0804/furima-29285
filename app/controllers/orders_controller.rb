class OrdersController < ApplicationController
  #before_action :authenticate_user!
  before_action :move_to_sessions, only: :index
  
  
  def index
    #unless user_signed_im?
      #redirect_to new_user_session_path 
    #end
    @item = Item.find(params[:item_id])
    @order = CreditOrder.new
  end

  def new
    
  end

  def create
    @item = Item.find(params[:item_id])
    @order = CreditOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end  
  end

  private

  def move_to_sessions
    @item = Item.find(params[:item_id])
    unless user_signed_in? && current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def order_params
    params.permit(:token, :post_number, :prefecture_id, :city, :street_number, :building, :phone_number, :item_id).merge(user_id: current_user.id)
  end
  
  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
end
