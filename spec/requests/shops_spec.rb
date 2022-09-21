# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/shops', type: :request do
  describe 'GET /shops' do
    let!(:shop) { create(:shop) }

    context '作成されたidを指定した場合' do
      it 'returns http success' do
        get shop_path(shop.id)
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
