require 'rails_helper'

RSpec.describe "Reels", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/reels/new"
      expect(response).to have_http_status(:success)
    end
  end

end
