FactoryBot.define do
  factory :item do
    name                        { 'pc' }
    explanation                 { '硬い' }
    category_id                 { 2 }
    status_id                   { 2 }
    shipping_charge_id          { 2 }
    prefecture_id               { 2 }
    days_to_ship_id             { 2 }
    price                       { 300 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/google-play.png'), filename: 'google-play.png',
                        content_type: 'image/png')
    end
  end
end
