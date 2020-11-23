class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :new]

  def index
    @item = Item.find(params[:item_id])
  end

  def new
  end

  def create
    @order = ItemTransaction.new(order_params)
    @item = Item.find(params[:item_id])
    # binding.pry
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  def set_order
    @order = ItemTransaction.new
  end

  private

  def order_params
    params.require(:item_transaction).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :telephone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'     
    )
  end
    
end
