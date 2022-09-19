# frozen_string_literal: true

class CitiesController < ApplicationController
  def show
    city_id = params[:id]

    @city = City.find_by(id: city_id)
    @prefecture = @city&.prefecture
    @shops = @city&.shops
  end
end
