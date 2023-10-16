class User < ApplicationRecord
  has_many :activities_as_organizer, class_name: 'Activity', foreign_key: 'organizer_id'
  has_many :activities_as_participant, class_name: 'Activity', foreign_key: 'participant_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
