# frozen_string_literal: true

class ShopsController < ApplicationController
  def show
    @shop = Shop.find(params[:id])
    @reviews = @shop.reviews
  end
end
