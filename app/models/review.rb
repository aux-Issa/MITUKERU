class Review < ApplicationRecord
  belongs_to :shop
  belongs_to :city
end
