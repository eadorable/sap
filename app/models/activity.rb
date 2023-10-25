class Activity < ApplicationRecord
  belongs_to :category
  belongs_to :owner, foreign_key: 'owner_id', class_name: 'User'

  has_many :bookings
  # has_many :chatrooms, through: :bookings

  scope :upcoming, -> { find_future_activities }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: %i[name address description],
                  using: {
                    tsearch: { prefix: true }
                  }

  def self.find_future_activities
    where("date_time > ?", Time.current)
  end
  validates :name, presence: true
  validates :address, presence: true
  validates :date_time, presence: true
  validates :description, presence: true
  validates :difficulty, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :equipment, presence: true
end
