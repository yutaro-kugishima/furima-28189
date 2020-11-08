class ItemsController < ApplicationController
    before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render:new
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:image, :list, :detail, :price, :category_id, :status_id, :fee_id, :delivery_place_id, :delivery_days_id).merge(user_id: current_user.id)
  end
end