require 'rails_helper'

RSpec.describe "Api::V1::Fedexes", type: :request do
  describe "GET /get" do
    it "returns http success" do
      get "/api/v1/fedex/get"
      expect(response).to have_http_status(:success)
    end
  end

end
