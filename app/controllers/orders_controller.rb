class OrdersController < ApplicationController
  #before_action :authenticate_user!
  before_action :move_to_sessions, only: :index
  
  
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    
  end

  def create
    #@item = Item.find(params[:item_id])
    @order = CreditOrder.new(order_params)
    #binding.pry
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
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def order_params
    params.permit(:token, :post_number, :prefecture_id, :city, :street_number, :building, :phone_number, :item_id)
    #params.permit(:authenticity_token, :post_number, :prefecture_id, :city, :street_number, :building, :phone_number, :item_id)
  end
  
  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      #amount: 7000,
      amount: @item.price,
      #card: order_params[:authenticity_token],
      card: order_params[:token],
      currency:'jpy'
    )
  end
end
