require "rails_helper"

RSpec.describe "/cities", :type => :request do
  describe 'GET /cities' do
    let!(:city){FactoryBot.create(:city)}
    context "作成されたidを指定した場合" do
      it "should return http success" do
        get city_path(city.id)
        expect(response).to have_http_status(200)
      end
    end
  end
end