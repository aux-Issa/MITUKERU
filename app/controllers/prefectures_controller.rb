# frozen_string_literal: true

class PrefecturesController < ApplicationController
  def show
    # TODO: Citiesコントローラで表示する内容と全く一緒なのでpartial化を検討
    prefecture_id = params[:id]
    cities = City.where(prefecture_id:)

    @city = nil
    @prefecture = Prefecture.find_by(id: prefecture_id)
    @shops = cities.map(&:shops).flatten.uniq
  end
end
