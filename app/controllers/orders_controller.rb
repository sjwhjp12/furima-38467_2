class OrdersController < ApplicationController
  before_action :purchasing_and_login_restrictions, only:[:index]
  before_action :seller_cannot_buy, only:[:index]
  before_action :detail_screen_migration_restrictions, only:[:index]
  before_action :order_set_item, only:[:index, :create]

  def index
    @order_purchase_record = OrderPurchaseRecord.new
  end

  def create
       @order_purchase_record = OrderPurchaseRecord.new(order_params)
    if @order_purchase_record.valid?
       pay_item
       @order_purchase_record.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_purchase_record).permit(:prefecture_id, :postal_code, :city, :building, :addresses, :phone_number, :item_id, :purchase_record_id).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
     Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def order_set_item
    @item = Item.find(params[:item_id])
  end

  def purchasing_and_login_restrictions
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def seller_cannot_buy
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def detail_screen_migration_restrictions
    @item = Item.find(params[:item_id])
    if PurchaseRecord.exists?(item_id: @item.id)
    redirect_to root_path
    end
  end
end