class Participant < ApplicationRecord
  has_many :bookings
  has_many :activities, through: :bookings
end
