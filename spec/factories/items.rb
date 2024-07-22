FactoryBot.define do
  factory :item do

    title{"テスト"}
    explanation {"テスト"}
    category_id { 1 }
    condition_id { 1 }
    ship_fee_id { 1 }
    region_id { 1 }
    require_time_id { 1 }
    price {1000}

    association :user
    

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
