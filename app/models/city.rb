class City < ApplicationRecord
  belongs_to :prefecture
  has_many :shops, dependent: :restrict_with_error
  has_many :assessable_areas, dependent: :restrict_with_error
  has_many :shops, through: :assessable_areas
  has_many :reviews, dependent: :restrict_with_error
end
