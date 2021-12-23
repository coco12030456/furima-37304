FactoryBot.define do
  factory :item do
    title         {'test'}
    info          {'test'}
    price         {300}
    category_id   {2}
    condition_id  {2}
    send_price_id {2}
    area_id       {2}
    send_day_id   {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
