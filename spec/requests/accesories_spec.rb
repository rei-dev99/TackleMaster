require 'rails_helper'

RSpec.describe "Accesories", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/accesories/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/accesories/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/accesories/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/accesories/show"
      expect(response).to have_http_status(:success)
    end
  end

end
