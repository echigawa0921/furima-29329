class ItemPurchasesController < ApplicationController
  before_action :authenticate_user!,only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @item_purchase = UserItemPurchase.new
  end

  def create
    @item_purchase = UserItemPurchase.new(item_purchase_params)
    if @item_purchase.valid?
      pay_item
      @item_purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def item_purchase_params
    params.require(:user_item_purchase).permit(:postal_cord, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id).merge(item_id: params[:item_id]).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: item_purchase_params[:token],
      currency:'jpy'
    )
  end
end
