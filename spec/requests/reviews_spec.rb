require "rails_helper"

RSpec.describe "/reviews", :type => :request do
  describe 'GET /reviews' do
    let!(:review){FactoryBot.create(:review)}
    context "作成されたidを指定した場合" do
      it "should return http success" do
        get review_path(review.id)
        expect(response).to have_http_status(200)
      end
    end
  end
end