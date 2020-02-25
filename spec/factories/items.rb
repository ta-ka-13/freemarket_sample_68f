FactoryBot.define do
  factory :item do
    name                  {"aaa"}
    price                 {300}
    description           {"aaa"}
    condition             {"新品未使用"}
    shopping_charges      {"送料込み(出品者負担)"}
    prefecture_id         {"千葉県"}
    shopping_date         {"aaa"}
    user
    category

    trait :item_with_image do
      after(:build) do |item|
        item.images << build(:image, item: item)
      end
    end
  end
end
