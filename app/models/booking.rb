class Booking < ApplicationRecord
  belongs_to :organizer
  belongs_to :participant
  belongs_to :activity
end
