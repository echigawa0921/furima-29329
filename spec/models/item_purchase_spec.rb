require 'rails_helper'

RSpec.describe UserItemPurchase, type: :model do
  describe '購入情報の保存' do
    before do
      @user_item_purchase = FactoryBot.build(:user_item_purchase)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_item_purchase).to be_valid
    end
    it 'postal_cordが空だと保存できないこと' do
      @user_item_purchase.postal_cord = ""
      @user_item_purchase.valid?
      expect(@user_item_purchase.errors.full_messages).to include("Postal cord can't be blank", "Postal cord can't be blank", "Postal cord is invalid")
    end
    it 'postal_cordにハイフンがないと保存できないこと' do
      @user_item_purchase.postal_cord = "1234567"
      @user_item_purchase.valid?
      expect(@user_item_purchase.errors.full_messages).to include("Postal cord is invalid")
    end
    it 'prefecture_idが空だと保存できないこと' do
      @user_item_purchase.prefecture_id = ""
      @user_item_purchase.valid?
      expect(@user_item_purchase.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'prefecture_idが1だと保存できないこと' do
      @user_item_purchase.prefecture_id = "1"
      @user_item_purchase.valid?
      expect(@user_item_purchase.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'municipalityが空だと保存できないこと' do
      @user_item_purchase.municipality = ""
      @user_item_purchase.valid?
      expect(@user_item_purchase.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @user_item_purchase.address = ""
      @user_item_purchase.valid?
      expect(@user_item_purchase.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @user_item_purchase.phone_number = ""
      @user_item_purchase.valid?
      expect(@user_item_purchase.errors.full_messages).to include("Phone number can't be blank", "Phone number can't be blank", "Phone number is invalid")
    end
    it 'phone_numberにハイフンがあると保存できないこと' do
      @user_item_purchase.phone_number = "090-1111-1111"
      @user_item_purchase.valid?
      expect(@user_item_purchase.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが11桁以内でないと保存できないこと' do
      @user_item_purchase.phone_number = "090111111111"
      @user_item_purchase.valid?
      expect(@user_item_purchase.errors.full_messages).to include("Phone number is invalid")
    end
  end
end