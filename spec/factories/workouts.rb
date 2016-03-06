FactoryGirl.define do
  factory :workout do
    date_time { Date.today.strftime("%A, %B %d %I:%M %P") }
    activity { FFaker::Sport.name }
    location { FFaker::AddressUS.neighborhood }
    description { FFaker::HipsterIpsum.words(4).join(',') }
  end
end
