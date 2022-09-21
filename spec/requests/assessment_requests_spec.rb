# post
# 最悪後回し

require "rails_helper"

RSpec.describe "/assessment_requests", :type => :request do
  describe 'GET /assessment_requests' do
    context "作成されたidを指定したばあい" do
      # let!(:shop){build(:shop,name: nil)}
      let!(:shop){FactoryBot.create(:shop)}
      it "return http success" do
        # get assessment_requests_path
        
        binding.pry
        
        puts shop.name
        
        get shop_path, params {shop.id}
        expect(response).to have_http_status(200)
      end
    end
    context "作成されていないidを指定した場合" do
      it "return http success" do
        # get assessment_requests_path
        get shop_path, params{2}
        expect(response).to have_http_status(404)
      end
    end
    
    it "return http success" do
      # get assessment_requests_path
      get assessment_requests_success_path
      expect(response).to have_http_status(200)
    end
  end
end