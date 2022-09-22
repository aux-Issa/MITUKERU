# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/cities', type: :request do
  describe 'GET /cities' do
    let!(:city) { create(:city) }

    context '作成されたidを指定した場合' do
      it 'returns http success' do
        get city_path(city.id)
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
