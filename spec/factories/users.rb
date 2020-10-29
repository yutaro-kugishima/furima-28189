FactoryBot.define do
  factory :user do
    nickname              {"yamada"}
    email                 {"yamada@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"山田"}
    last_name             {"太郎"}
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"タロウ"}
    birth_date              {"2020-01-01"}
  end
end