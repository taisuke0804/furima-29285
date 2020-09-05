FactoryBot.define do
  factory :credit_order do
    post_number {'123-4567'}
    prefecture_id {3}
    city {"札幌市"}
    street_number {"大通り3-1-22"}
    building {"マンション505"}
    phone_number {'09011112222'}
    token {123}
    #association :management
  end
end
