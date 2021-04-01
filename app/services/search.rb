module Search
  class AvailableHotel
    def initialize(params)
      @params = params
      @city = params[:city]
      @arrival_date = params[:arrival_date]
      @departure_date = params[:departure_date]
      @number_of_rooms = params[:number_of_rooms]
    end

    def find
      if @city && @arrival_date && @departure_date && @number_of_rooms
        dates = (@arrival_date.to_date..@departure_date.to_date).to_a

        Hotel
          .joins(:room_availabilities)
          .where("lower(city) = ?", @city.downcase)
          .where(room_availabilities: { date: dates })
          .where("room_availabilities.available_rooms >= ?", @number_of_rooms)
          .uniq
      else
        []
      end
    end
  end
end
