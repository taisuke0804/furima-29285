class OrdersController < ApplicationController
  before_action :item_find, only: [:index, :create, :move_to_sessions, :pay_item, :no_buying]
  before_action :move_to_sessions, only: :index
  before_action :no_buying
  
  def index
    @order = CreditOrder.new
  end

  def new
    
  end

  def create
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
  
  def item_find
    @item = Item.find(params[:item_id])
  end

  def move_to_sessions
    unless user_signed_in? && current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def order_params
    params.permit(:token, :post_number, :prefecture_id, :city, :street_number, :building, :phone_number, :item_id).merge(user_id: current_user.id)
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def no_buying
    if @item.management != nil
      redirect_to root_path
    end
  end
end
