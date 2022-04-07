FactoryBot.define do
  factory :user do
    nickname               {Faker::Name.initials(number: 2)}
    email                  {Faker::Internet.free_email}
    password               { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation  {password}
    first_name             {'太郎'}
    last_name              {'試験'}
    first_name_kana        {'タロウ'}
    last_name_kana         {'テスト'}
    birthday               {Faker::Date.birthday(min_age: 0, max_age: 100)}
  end
end