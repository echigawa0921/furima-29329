require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいく' do
      it 'product_name,introduction,category_id,status_id,delivery_fee_id,shipment_source_id,shipping_day_id,price,imageが存在すれば商品出品できる' do
        expect(@item).to be_valid
      end

    end

    context '商品出品がうまくいかない' do
      it "product_nameが空だと出品できない" do
        @item.product_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it "introductionが空だと出品できない" do
        @item.introduction = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it "category_idが空だと出品できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it "status_idが空だと出品できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
      end
      it "delivery_fee_idが空だと出品できない" do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank", "Delivery fee is not a number")
      end
      it "shipment_source_idが空だと出品できない" do
        @item.shipment_source_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source can't be blank", "Shipment source is not a number")
      end
      it "shipping_day_idが空だと出品できない" do
        @item.shipping_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank", "Shipping day is not a number")
      end
      it "priceが空だと出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not a number")
      end
      it "priceが¥300~¥9,999,999でないと出品できない" do
        @item.price = "100"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが半角数値出ないと出品できない" do
        @item.price = "１００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end




