class UpdateRoomAvailability
  def initialize(params)
    @params = params
    @reservation = params[:reservation]
    @update_type = params[:type]
  end

  def execute
    update_rooms
  end

  private

  def update_rooms
    RoomAvailability.where(hotel: @reservation.hotel, date: dates).find_each do |record|
      new_available_rooms = get_new_rooms_count(record.available_rooms)
      if valid_rooms_count?(new_available_rooms)
        record.update(available_rooms: new_available_rooms)
      end
    end
  end

  def dates
    (@reservation.arrival_date..@reservation.departure_date).to_a
  end

  def get_new_rooms_count(available_rooms)
    booked_rooms = @reservation.number_of_rooms
    
    case @update_type
    when "Reserved"
      available_rooms - booked_rooms
    when "Cancelled"
      available_rooms + booked_rooms
    end
  end

  def valid_rooms_count?(new_available_rooms)
    new_available_rooms >= 0 && new_available_rooms <= @reservation.hotel.number_of_rooms 
  end
end