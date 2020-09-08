FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    #password {Faker::Internet.password(min_length: 6, max_length: 20)}
    password {"1234abcd"}
    password_confirmation {password}
    family_name {"田中"}
    first_name {"太郎"}
    family_name_kata {"タナカ"}
    first_name_kata {"タロウ"}
    birth {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
  end
end