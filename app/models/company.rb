# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :shops

  validates :name, presence: true
  validates :ieul_company_id, presence: true, uniqueness: true
end
