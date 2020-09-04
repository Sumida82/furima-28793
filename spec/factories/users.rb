FactoryBot.define do
  factory :user do
    name                  {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"1234567"}
    password_confirmation {password}
    first_name            {"祐太"}
    family_name           {"安倍"}
    first_name_kana       {"ユウタ"}
    family_name_kana      {"アベ"}
    birth                 {"1998-12-23"}
  end
end