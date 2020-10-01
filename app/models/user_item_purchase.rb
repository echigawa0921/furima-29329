class UserItemPurchase

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_cord, :prefecture_id, :municipality, :address, :building_name, :phone_number,:token

  with_options presence: true do
    validates :postal_cord, :prefecture_id, :municipality, :address, :phone_number
    validates :postal_cord, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :phone_number, format: {with: /\A\d{10}$|^\d{11}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
  end

  def save
    item_purchase = ItemPurchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_cord: postal_cord, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name,phone_number: phone_number, item_purchase_id: item_purchase.id)
  end
end