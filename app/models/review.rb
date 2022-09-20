# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :shop
  belongs_to :city

  with_options presence: true do
    validates :remaining_address, length: { minimum: 1, maximum:255 }
    validates :type_of_property
    validates :times_of_sales
    validates :sale_consideration_date
    validates :assessment_request_date
    validates :sale_date
    validates :sold_out_date
    validates :delivery_date
    validates :gender
    validates :age
    validates :assessment_price
    validates :sale_price
    validates :contract_price
    validates :contract_category
    validates :title, length: { minimum: 1, maximum: 255 }
    validates :reason_for_sales
    validates :concern_at_sales, length: { minimum: 10, maximum: 500 }
    validates :reason_for_selection, length: { minimum: 10, maximum: 500 }
    validates :response_satisfaction, length: { minimum: 10, maximum: 500 }
    validates :reason_for_response_satisfaction, length: { minimum: 10, maximum: 500 }
    validates :advice, length: { minimum: 10, maximum: 500 }
  end
  validates :improvement_point, length: { minimum: 10, maximum: 500 }

  enum type_of_property: { apartment: 0, house: 1, land: 2 }
  enum gender: { male: 0, female: 1, other: 2 }
  enum reason_for_sales: {
    relocation: 1,
    inheritance: 2,
    job_change: 3,
    divorce: 4,
    asset_liquidation: 5,
    financial_reason: 6,
    other_reason: 99
  }
  enum contract_category: {
    privileged_and_exclusive_brokerage_service_agreement: 1,
    exclusive_brokerage_service_agreement: 2,
    non_exclusive_brokerage_service_agreement: 3,
    unknown: 4
  }
  enum times_of_sales: { first_time: 0, second_time: 1, more_than_two_times: 2 }
end
