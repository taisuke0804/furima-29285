class DetailsController < ApplicationController
  before_action :search_item, only: [:index, :search]

  def index
    @items = Item.all.order("created_at DESC")
    @item = @p.result.order("created_at DESC").includes(:user)
  end

  def search
  end


  private

  def search_item
    @p = Item.ransack(params[:q])
  end

end
