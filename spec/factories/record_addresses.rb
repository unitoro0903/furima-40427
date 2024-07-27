FactoryBot.define do
  factory :record_address do
    postal_code { '123-4567' }
    region_id { 1 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '1234567890' }
    token {"tok_abcdefghijk00000000000000000"}

   
  end
end
