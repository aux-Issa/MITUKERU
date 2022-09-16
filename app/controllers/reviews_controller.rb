# frozen_string_literal: true

class ReviewsController < ApplicationController
  def show
    @review = Review.find_by(id: params[:id])
    @shop = @review.shop
  end
end
