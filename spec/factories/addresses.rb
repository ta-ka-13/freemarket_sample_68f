FactoryBot.define do
  factory :address do
    destination_family_name       {"阿部"}
    destination_last_name         {"浩己"}
    destination_family_name_kana  {"アベ"}
    destination_last_name_kana    {"コウキ"}
    postal_code                   {"2848838"}
    prefecture_id                   {"千葉県"}
    municipalities                {"船橋市"}
    address                       {"行徳1-3-1"}
  end
end