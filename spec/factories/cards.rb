FactoryBot.define do
  factory :card do
    customer_id { "MyString" }
    card_id     { "MyString" }
    user
  end
end
