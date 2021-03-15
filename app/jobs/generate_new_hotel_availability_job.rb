class GenerateNewHotelAvailabilityJob < ApplicationJob
  queue_as :urgent

  def perform(hotel)
    (Date.today..179.days.from_now).each do |date|
      hotel.room_availabilities.find_or_create_by!(date: date) do |h|
        h.available_rooms = hotel.number_of_rooms
      end
    end
  end
end
