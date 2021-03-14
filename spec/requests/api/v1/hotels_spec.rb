require "rails_helper"

module Api
  module V1
    RSpec.describe "Hotels", type: :request do
      describe "GET /api/v1/search" do
        let!(:hotels) { create_list(:hotel, 10) }

        context "without params" do
          before { get "/api/v1/search" }

          it "returns all hotels when no params given" do
            expect(json.length).to eql(10)
          end

          it "returns http success" do
            expect(response).to have_http_status(:success)
          end
        end

        context "with params" do
          it "returns empty array when no hotels found" do
            get "/api/v1/search?city=Dhaka123"

            expect(json).to be_empty
          end
        end
      end
    end
  end
end
