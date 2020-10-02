class HomesController < ApplicationController
  def index
    @room_types = RoomType.all
  end
  # To fetch all available rooms
  def getRooms
   
    @check_in = params[:check_in]
    @check_out = params[:check_out]
    @room_type = params[:room_type]
    @rooms = Room.available_on(@check_in, @check_out,@room_type )
    puts "Hello #{@rooms}"
    puts "JSON #{@rooms.to_json}"
    respond_to do |format|
      format.json {render json: @rooms.to_json}
      format.js
      format.html
    end
  end

  #  Fetch all user specific reserved rooms
   def getUserReservedRooms
    @user_id =  current_user.id
    @reserved_rooms = User.reservations(@user_id)
    respond_to do |format|
      format.json {render json: @reserved_rooms.to_json}
      format.js
      format.html
    end
   end
  def show
  end

end
