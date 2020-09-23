FactoryBot.define do
  factory :user do
    nickname              {"アイウエオ"}
    email                 {"aaa@sample.com"}
    password              {"aaa000"}
    password_confirmation {password}
    last_name             {"田中"}
    first_name            {"太郎"}
    last_name_kana        {"タナカ"}
    first_name_kana       {"タロウ"}
    birthday              {"1930-01-01"}
  end
end