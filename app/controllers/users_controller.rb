class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @items = @user.items.order("created_at DESC")
  end

  def edit
    
  end
  
  def create
    
  end
end
