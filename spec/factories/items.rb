FactoryBot.define do
  factory :item do
    association :image
    name                  {"aaa"}
    price                 {300}
    description           {"aaa"}
    condition             {"新品未使用"}
    shopping_charges      {"送料込み(出品者負担)"}
    shopping_area         {"千葉県"}
    shopping_date         {"aaa"}
    category_id           {3}
    user
    category
  end
end
