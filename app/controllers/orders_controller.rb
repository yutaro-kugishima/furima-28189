class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :new]

  def index
  end

  def new
  end

  def create
    # binding.pry
    @order = ItemTransaction.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      redirect_to action: :index
    end
  end

  def set_order
    @order = ItemTransaction.new
  end

  private

  def order_params
    params.require(:item_transaction).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :telephone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end

end
