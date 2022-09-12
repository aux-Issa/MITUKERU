class Shop < ApplicationRecord
  belongs_to :company
  belongs_to :city
  has_many :assessable_areas
  has_many :cities, through: :assessable_areas
  has_many :reviews
end
