# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/reviews', type: :request do
  describe 'GET /reviews' do
    let!(:review) { create(:review) }

    context '作成されたidを指定した場合' do
      it 'returns http success' do
        get review_path(review.id)
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
