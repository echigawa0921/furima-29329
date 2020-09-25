class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,               foreign_key: true
      t.string     :product_name,       null: false
      t.string     :introduction,       null: false
      t.integer    :category_id,        null: false
      t.integer    :status_id,          null: false
      t.integer    :delivery_fee_id,    null: false
      t.integer    :shipment_source_id, null: false
      t.integer    :shipping_day_id,    null: false
      t.integer    :price,              null: false 
      t.timestamps
    end
  end
end
