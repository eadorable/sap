class Activity < ApplicationRecord
  belongs_to :organizer, class_name: 'User'
  belongs_to :participant, class_name: 'User'
  has_many :bookings, dependent: :destroy
  validates :activity_name, :address, :description, :difficulty, :equipment, presence: true
  validates :difficulty, inclusion: { in: %i[1,2,3,4,5] }
  validates :date_time, presence: true
end
