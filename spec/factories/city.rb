FactoryBot.define do
  factory :company do
    association :prefecture
    association :shop
    association :review
    association :assessable_area
    name {"test市区町村"}
    # prefecture_company_id {1}
  end
end