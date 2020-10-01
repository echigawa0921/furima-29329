class ItemPurchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :shipping_adderesse

  attr_accessor :token
  validates :token, presence: true
end
