require 'rails_helper'

RSpec.describe "ItemTransactions", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/item_transactions/index"
      expect(response).to have_http_status(:success)
    end
  end

end
