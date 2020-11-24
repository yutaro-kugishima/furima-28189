class ItemsController < ApplicationController
    before_action :authenticate_user!, only: [:new]
    before_action :set_item, only: [:show, :edit, :update, :destroy]

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

  def show
  end
  
  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def set_item
    @item = Item.find(params[:id])
  end

  private
  
  def item_params
    params.require(:item).permit(:image, :list, :detail, :price, :category_id, :status_id, :fee_id, :delivery_place_id, :delivery_days_id).merge(user_id: current_user.id)
  end
end