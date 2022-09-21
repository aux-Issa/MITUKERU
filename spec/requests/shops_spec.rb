require "rails_helper"

RSpec.describe "/shops", :type => :request do
  describe 'GET /shops' do
    let!(:shop){FactoryBot.create(:shop)}
    context "作成されたidを指定した場合" do
      it "should return http success" do
        get shop_path(shop.id)
        expect(response).to have_http_status(200)
      end
    end
  end
end