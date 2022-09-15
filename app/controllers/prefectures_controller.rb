# frozen_string_literal: true

class PrefecturesController < ApplicationController
  def show
    prefecture_id = params[:id]
    cities = City.where(prefecture_id:)

    @prefecture_name = Prefecture.find_by(id: prefecture_id)&.name
    @shops = cities.map(&:shops).flatten
  end
end
