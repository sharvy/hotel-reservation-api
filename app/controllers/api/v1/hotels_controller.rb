class Api::V1::HotelsController < ApplicationController
  include Response

  def search
    @hotels = Search::AvailableHotel.new(params).find
    json_response(@hotels, :ok)
  end

  def make_reservation
    @reservation = MakeReservation.new(params).execute

    if @reservation
      json_response(@reservation, :created)
    else
      json_response(nil, :unprocessable_entity)
    end
  end
end
