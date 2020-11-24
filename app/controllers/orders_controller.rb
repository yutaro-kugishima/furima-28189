class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :new]
  before_action :item_find, only: [:index, :create]
  before_action :move_to_session, only: :index
  before_action :move_to_index, only: :index
  before_action :move_to_top, only: :index

  def index
  end

  def new
  end

  def create
    @order = ItemTransaction.new(order_params)
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


  def item_find
    @item = Item.find(params[:item_id])
  end

  def move_to_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
  
  def move_to_index
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def move_to_top
    if @item.order != nil
       redirect_to root_path
    end
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
