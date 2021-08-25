FactoryBot.define do
  factory :item do
    name                        { Faker::Name.initials(number: 4) }
    explanation                 { Faker::Name.initials(number: 10) }
    category_id                 { '2' }
    status_id                   { '2' }
    shipping_charge_id          { '2' }
    prefecture_id               { '2' }
    days_to_ship_id             { '2' }
    price                       { '300' }
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/google-play.png'), filename: 'google-play.png', content_type: 'image/png')
    end
  end
end