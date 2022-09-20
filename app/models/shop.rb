# frozen_string_literal: true

class Shop < ApplicationRecord
  belongs_to :company
  belongs_to :city
  has_many :assessable_areas
  has_many :cities, through: :assessable_areas
  has_many :reviews

  with_options presence: true do
    validates :ieul_shop_id, uniqueness: true
    validates :catch_copy, length: { minimum: 10, maximum: 500 }
    validates :remaining_address
    validates :introduction, length: { minimum: 10, maximum: 500 }
    validates :logo_url
  end
end
