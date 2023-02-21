FactoryBot.define do
  factory :item do
    item_name           {Faker::Name.name}
    item_description    {Faker::Lorem.sentence}
    item_category_id    {'3'}
    item_state_id       {'3'}
    delivery_burden_id  {'3'}
    delivery_area_id    {'3'}
    delivery_day_id     {'3'}
    item_price          {'1000'}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end


