class Booking < ApplicationRecord
  belongs_to :activity
  belongs_to :participant, foreign_key: 'participant_id', class_name: 'User'
end
