FactoryBot.define do
  factory :item do
    item {Faker::String.random(length: 1..40)}
    price {1000}
    category_id {Faker::Number.within(range: 2..10)}
    condition_id {Faker::Number.within(range: 2..7)}
    explanation {Faker::Lorem.sentence}
    delivery_fee_id {Faker::Number.within(range: 2..3)}
    sending_area_id{Faker::Number.within(range: 2..48)}
    sending_day_id{Faker::Number.within(range: 2..4)}
    association :user
  end
end
