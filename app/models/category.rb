class Category < ApplicationRecord
  has_many :activities
  has_many :users, through: :activities
  validates :name, presence: true, uniqueness: true

  def self.icon_creator(name)
    case name
    when "Wellness"
      return "wellness.png"
    when "Support"
      return "support.png"
    when "Community"
      return "community.png"
    when "Fitness"
      return "fitness.png"
    when "Outdoors"
      return "outdoors.png"
    when "Learning"
      return "learning.png"
    when "Arts"
      return "arts.png"
    when "Entertainment"
      return "entertainment.png"
    else
      "logo.png"
    end
  end
end
