class Category < ApplicationRecord
  belongs_to :activity
  validates :name, presence: true
end
