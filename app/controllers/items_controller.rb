class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create]

  def index
    @items = Item.all
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
    @item = Item.find(params[:id])  
  end

  def show
    @item = Item.find(params[:id])  
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to controller: :items, action: :index
    else
      render "edit"
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :introduction, :category_id, :status_id, :delivery_fee_id, :shipment_source_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  
end
