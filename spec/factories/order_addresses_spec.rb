FactoryBot.define do
  factory :order_address do
    postal_code      { "123-4567" }
    region_id        { 2 }
    city             { "神戸市" }
    address          { "柳町1-2-3" }
    building         { "森ビル" }
    phone_number     { "08012345678" }
    token            { "gggggigigiuhbnuibiuiubiu" }
  end
end