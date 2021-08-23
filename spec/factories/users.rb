FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 4)}
    email                 {Faker::Internet.free_email}
    password              {"111aaa"}
    password_confirmation {password}
    first_name            {"昭人"}
    last_name             {"時松"}
    first_name_kana       {"アキヒト"}
    last_name_kana        {"トキマツ"}
    birthday              {Faker::Date.birthday}
  end
end