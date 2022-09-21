FactoryBot.define do
  factory :company do
    name {"test不動産"}
    sequence(:ieul_company_id) { |n| 1000 + n}
  end
end