class MakeReservation
  def initialize(params)
    @params = params
  end

  def execute
    unless @params[:user] && @params[:reservation]
      return nil
    end

    create_user!
    create_reservation!
    update_availability!

    @reservation
  end

  private

  def create_user!
    @user = User.find_or_create_by!(user_params)
  end

  def create_reservation!
    @reservation = @user.reservations.create!(reservation_params)
  end

  def user_params
    @params.require(:user).permit(:first_name, :last_name, :email, :phone)
  end

  def reservation_params
    @params.require(:reservation).permit(:hotel_id, :arrival_date, :departure_date, :number_of_rooms)
  end

  def update_availability!
    UpdateRoomAvailability.new(reservation: @reservation, type: "Reserved").execute!
  end
end
