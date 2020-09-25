class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create]

  def index
  end

  def new  
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to controller: :items, action: :index
    else
      render "new"
    end
  end

  def edit  
  end

  def show  
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :introduction, :category_id, :status_id, :delivery_fee_id, :shipment_source_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  
end
