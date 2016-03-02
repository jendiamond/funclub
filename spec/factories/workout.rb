FactoryGirl.define do
  factory :workout do
    date { FFaker::HipsterIpsum.month}
    time { 8am }
    activity { FFaker::Sport.name }
    location { FFaker::AddressUS.neighborhood }
    description { FFaker::HipsterIpsum.words(4).join(',') }
  end
end
