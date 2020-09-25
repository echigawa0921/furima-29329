FactoryBot.define do
  factory :item do
    product_name {"あああああ"}
    introduction {"あああああ"}
    category_id {2}
    status_id {2}
    delivery_fee_id {2}
    shipment_source_id {2}
    shipping_day_id {2}
    price {300}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
