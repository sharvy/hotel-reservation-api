module Api
  module V1
    class HotelsController < ApplicationController
      include Response

      def search
        @hotels = Hotel.all
        json_response(@hotels, :ok)
      end
    end
  end
end
