class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]
  before_action :item_set, only: [:edit, :update, :show]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  def search
    @items = Item.search(params[:keyword]).order("created_at DESC")
  end

  private

  def move_to_index
    unless user_signed_in? 
      redirect_to action: :index
    end
  end

  def item_set
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :item, :explanation, :category_id, :condition_id, :delivery_fee_id, :sending_area_id, :sending_day_id, :price).merge(user_id: current_user.id)
  end

end
