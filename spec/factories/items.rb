FactoryBot.define do
  factory :item do
    title                {Faker::Lorem.characters(number: 30)}
    info                 {Faker::Lorem.characters(number: 900)}
    category_id          { 2 }
    status_id            { 2 }
    shipping_fee_id      { 2 }
    region_id            { 2 }
    schedule_id          { 2 }
    price                {Faker::Commerce.price(range: 300..9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end