# frozen_string_literal: true

class AssessableArea < ApplicationRecord
  belongs_to :shop
  belongs_to :city
end
