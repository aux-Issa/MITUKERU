# frozen_string_literal: true

FactoryBot.define do
  factory :prefecture do
    sequence(:name) { |n| "test都道府県 #{n}" }
  end
end
