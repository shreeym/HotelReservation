class Room < ApplicationRecord
  belongs_to :room_type
  has_many :reservations
  def self.available_on(checkin,checkout,type_id)
    # Checking for reserved room in the reservation table
    reserved_room_ids = Reservation.where(check_in:checkin, check_out: checkout).pluck(:room_id)
    # reserved_room_ids = Reservation.where('check_in >= ? AND check_out <= ?',checkin, checkout).pluck(:room_id)
    
    
    # room_type_id =  RoomType.find_by(id: type_id)
    puts "---------------------------------room_ids #{reserved_room_ids}"
    puts "---------------------------------type_id #{type_id}"
    #  byebug
    # Ignoring the Reserved room and returning the all available rooms and also checking for roomtype
    if type_id !=nil && !type_id.empty? && reserved_room_ids != []
      # User entered type and check_in check_out dates which are reserved
       puts "++++++++++++++++++++++++#{type_id}" 
       puts "%%%%%%%%%%%%%%%#{reserved_room_ids}"
        rooms = Room.where('id NOT IN (?) AND room_type_id IN (?)', reserved_room_ids,type_id)
    elsif type_id != nil && !type_id.empty?
      # user enters type and non reserved dates
        puts"*********************query by type_id"
        rooms = Room.where('room_type_id IN (?)', type_id)
        puts "rooms by checkin , checkout date and type_id #{rooms}"
    elsif reserved_room_ids != []
        #  Here user will getting reserved rooms for check_in AND check_out date so that we can ignore those dates from the room table
        rooms = Room.where('id NOT IN (?)', reserved_room_ids)
    else
      # if none are matching it retrives all available rooms
        rooms = Room.all
        puts "rooms by checkin and checkout date #{rooms}"
    end
    
    puts "rooms method is end #{rooms}"
    return rooms
    
  end

  # def self.reserved_on(day = Date.today)
  #   reserved_room_ids = Reservation.on(day).pluck('DISTINCT room_id')
  #   where(:id => reserved_room_ids)
  # end
end
