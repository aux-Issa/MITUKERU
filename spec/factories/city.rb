# frozen_string_literal: true

FactoryBot.define do
  factory :city do
    prefecture { build(:prefecture) }
    name { 'test市区町村' }
  end
end
