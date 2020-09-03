class OrdersController < ApplicationController
  #before_action :authenticate_user!
  before_action :move_to_sessions, only: :index
  
  
  def index
    @item = Item.find(params[:item_id])
  end

  private

  def move_to_sessions
    unless user_signed_in?
      redirect_to root_path
    end
  end
  
end
