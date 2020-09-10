class DetailsController < ApplicationController

  def index
    @items = Item.all.order("created_at DESC")
  end

  def search
    
  end

  private

  def search_product
    
  end
end
