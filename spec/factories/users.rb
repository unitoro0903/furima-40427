FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.email}
    password  { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    family_name_kanji {"山田"}
    first_name_kanji {"太郎"}
    family_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    birthday {Faker::Date.backward}
  end
end
