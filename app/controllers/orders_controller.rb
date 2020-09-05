class OrdersController < ApplicationController
  before_action :move_to_sessions, only: :index
  before_action :no_buying
  
  def index
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

  def no_buying
    @item = Item.find(params[:item_id])
    if @item.management != nil
      redirect_to root_path
    end
  end
end
