require "rails_helper"

RSpec.describe "/assessment_requests", :type => :request do
  describe 'GET /assessment_requests' do
    let!(:shop){FactoryBot.create(:shop)}
    context "作成されたidを指定した場合" do
      it "should return http success" do
        get("/assessment_requests?shop_id=#{shop.id}") 
        expect(response).to have_http_status(200)
      end
    end
  end
end