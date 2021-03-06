class OrdersController < ApplicationController
  before_action :set_item, only: [:new, :create]
  before_action :set_purchase, only: [:new, :create]
  before_action :move_to_index, only: :new

  def new
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_code_id, :city, :house_number, :building_name, :phone_number, :token).merge(user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,           # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_purchase
    @purchase = Purchase.pluck(:item_id)
  end

  def move_to_index
    if current_user.id == @item.user.id
      redirect_to root_path
    end
    if @purchase.include?(@item.id)
      redirect_to root_path
    end
  end
end

