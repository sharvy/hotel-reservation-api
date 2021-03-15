class Api::V1::HotelsController < ApplicationController
  include Response

  def search
    @hotels = Search::AvailableHotel.new(params).find
    json_response(@hotels, :ok)
  end
end
