class Activity < ApplicationRecord
  belongs_to :category
  belongs_to :owner, foreign_key: 'owner_id', class_name: 'User'

  scope :upcoming, -> { find_future_activities }

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: %i[name address description],
                  using: {
                    tsearch: { prefix: true }
                  }

  def self.find_future_activities
    where("date_time > ?", Time.current)
  end
end
