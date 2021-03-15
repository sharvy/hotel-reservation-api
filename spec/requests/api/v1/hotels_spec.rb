require "rails_helper"

RSpec.describe Api::V1::HotelsController, type: :request do
  describe "GET /api/v1/search" do
    let(:url) { "/api/v1/search" }
    let(:city_1) { "City1" }
    let(:city_2) { "City2" }
    let(:arrival_date) { Date.today + 2.days }
    let(:departure_date) { Date.today + 3.days }
    let(:number_of_rooms) { 5 }

    context "without params" do
      let!(:hotel) { create(:hotel) }
      before { get url }

      it "returns zero hotels when no params given" do
        expect(json.length).to eql(0)
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
    end

    context "with params" do
      let!(:hotel_1) { create(:hotel, city: city_1) }
      let!(:hotel_2) { create(:hotel, city: city_2) }

      it "returns hotels when arrival_date, departure_date, city, and number_of_rooms given" do
        get "#{url}?city=#{city_1}&arrival_date=#{arrival_date}&departure_date=#{departure_date}&number_of_rooms=#{number_of_rooms}"

        expect(json.length).to eql(1)
      end
    end
  end

  describe "POST /api/v1/make_reservation" do
    let(:url) { "/api/v1/make_reservation" }
    let!(:hotel) { create(:hotel) }

    context "with invalid params" do
      before { post url }

      it "returns http status unprocessable entity 422" do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "with valid reservation params" do
      let(:user_attributes) { attributes_for(:user) }
      let(:reservation_attributes) { attributes_for(:reservation, hotel_id: hotel.id) }

      before { post url, params: { user: user_attributes, reservation: reservation_attributes } }

      it "returns http status created" do
        expect(response).to have_http_status(:created)
      end

      it "returns reservation" do
        expect(json["id"]).not_to be_nil
        expect(json["arrival_date"]).to eql((Date.today + 2.days).to_s)
      end
    end
  end
end
