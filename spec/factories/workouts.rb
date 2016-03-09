FactoryGirl.define do
  factory :workout do |f|
    f.date_time { Date.today.strftime("%A, %B %d %I:%M %P") }
    f.activity { FFaker::Sport.name }
    f.location { FFaker::AddressUS.neighborhood }
    f.description { FFaker::HipsterIpsum.words(4).join(',') }
  end

  factory :invalid_workout, parent: :workout do |f|
    f.date_time nil
    f.activity nil
  end
end
