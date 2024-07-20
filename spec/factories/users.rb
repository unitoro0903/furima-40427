FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.email}
    password  { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    family_name_kanji {Faker::Name.last_name}
    first_name_kanji {Faker::Name.first_name}
    family_name_kana {Faker::Name.last_name}
    first_name_kana {Faker::Name.first_name}
    birthday {Faker::Date.backward}
  end
end
