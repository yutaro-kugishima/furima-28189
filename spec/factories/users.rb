FactoryBot.define do
  factory :user do
    nickname              {"yamada"}
    email                 {"yamada@gmail.com"}
    password              {"1a2b3c4d"}
    password_confirmation {"1a2b3c4d"}
    first_name            {"山田"}
    last_name             {"太郎"}
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"タロウ"}
    birth_date              {"2020-01-01"}
  end
end