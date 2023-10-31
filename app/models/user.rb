class User < ApplicationRecord
  has_many :bookings, foreign_key: 'participant_id', class_name: 'Booking'
  has_many :activities, foreign_key: 'owner_id', class_name: 'Activity'
  has_one_attached :profile_image

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
