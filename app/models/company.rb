class Company < ApplicationRecord
  has_many :shops, dependent: :destroy
end
