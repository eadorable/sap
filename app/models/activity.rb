class Activity < ApplicationRecord
  belongs_to :category
  belongs_to :owner, foreign_key: 'owner_id', class_name: 'User'


  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :address, :description],
    using: {
      tsearch: { prefix: true }
    }
end
