FactoryBot.define do
  factory :order_delivery_address do
    user_id            { Faker::Number.non_zero_digit }
    item_id            { Faker::Number.non_zero_digit }
    postal_code        {'111-1111'}
    delivery_area_id   {'3'}
    city               {'千代田区'}
    block              {'1番地'}
    building_name      {'建物'}
    phone_number       { Faker::Number.decimal_part(digits: 11) }
    token              {"tok_abcdefghijk00000000000000000"}
    
  end
end
