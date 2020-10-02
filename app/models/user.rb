class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :reservations

         def self.reservations(user_id)
          #  Fetching rooms for specific user
          room_ids =Reservation.where(user_id: user_id).pluck(:room_id)
         rooms = Room.where('id IN (?)',room_ids)
         return rooms

         end
end
