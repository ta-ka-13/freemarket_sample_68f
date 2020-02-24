FactoryBot.define do

  factory :user do
    name                  {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name           {"阿部"}
    last_name             {"浩己"}
    family_name_kana      {"アベ"}
    last_name_kana        {"コウキ"}
    birth_year            {1996}
    birth_month           {10}
    birth_day             {4}
  end

end