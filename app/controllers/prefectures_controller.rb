# frozen_string_literal: true

class PrefecturesController < ApplicationController
  def show
    prefecture_id = params[:id]
    cities = City.where(prefecture_id:)

    @city = nil
    @prefecture = Prefecture.find_by(id: prefecture_id)
    @shops = cities.map(&:shops).flatten.uniq
  end
end
