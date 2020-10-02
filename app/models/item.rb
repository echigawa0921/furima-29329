class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  has_one :item_purchase
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :shipping_day

  validates :product_name, :introduction, :category, :status, :delivery_fee, :shipment_source, :shipping_day, :image,  presence: true
  validates :price, presence: true, format: {with: /\A[0-9]+\z/,},numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :category_id, :status_id, :delivery_fee_id, :shipment_source_id, :shipping_day_id, numericality: { other_than: 1 }
end
