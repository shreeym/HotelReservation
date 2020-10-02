class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user
  # scope :on, lambda {|day = Date.today| where('check_in > ? AND check_out < ?', chec, day) }
end
