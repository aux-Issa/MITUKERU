# frozen_string_literal: true

class CitiesController < ApplicationController
  def show
    city_id = params[:id]

    @city = City.find_by(id: city_id)
    @shops = @city.shops
  end
end
