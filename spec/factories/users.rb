FactoryGirl.define do
  factory :user do
    name { FFaker::Name.name }
    email "name@email.com"
    phone { FFaker::PhoneNumber.short_phone_number }
    address { FFaker::Address.street_address.city.zip_code }
    birthday "11/19"
    avatar { FFaker::Avatar.image }
  end
end