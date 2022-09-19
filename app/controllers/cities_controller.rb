# frozen_string_literal: true

class CitiesController < ApplicationController
  def show
    city_id = params[:id]

    @city = City.find(city_id)
    # TODO: cityが見つからなかった時の処理
    @prefecture = @city.prefecture
    @shops = @city&.shops
  end
end
