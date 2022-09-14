# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :prefecture
  has_many :assessable_areas
  has_many :shops, through: :assessable_areas
  has_many :reviews
end
