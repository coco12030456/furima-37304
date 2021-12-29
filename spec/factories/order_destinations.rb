FactoryBot.define do
  factory :order_destination do
    post_code { '123-4567' }
    area_id { 2 }
    city { '東京都' }
    block { '1-1' }
    building { '東京ハイツ' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
