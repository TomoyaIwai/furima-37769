FactoryBot.define do
  factory :item do
    title                {Faker::Lorem.characters(number: 5)}
    info                 {Faker::Lorem.characters(number: 10)}
    category_id          { 2 }
    status_id            { 2 }
    shipping_fee_id      { 2 }
    region_id            { 2 }
    schedule_id          { 2 }
    price                {Faker::Commerce.price(range: 300..9999999)}
    association :user
  end
end