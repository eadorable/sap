class Category < ApplicationRecord
  has_many :activities
  has_many :users, through: :activities
  validates :name, presence: true, uniqueness: true
end
