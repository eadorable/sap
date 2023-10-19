class Activity < ApplicationRecord
  belongs_to :category
  belongs_to :owner, foreign_key: 'owner_id', class_name: 'User'

  validates :name, presence: true
  validates :address, presence: true
  validates :date_time, presence: true
  validates :description, presence: true
  validates :difficulty, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :equipment, presence: true
end
