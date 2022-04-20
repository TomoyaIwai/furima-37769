FactoryBot.define do
  factory :order do
    postal_code      { "123-4567" }
    region_id        { 2 }
    city             { "松戸市" }
    address          { "柳町1-2-3" }
    phone_number     { "08086758493" }
    token            {}
  end
end
