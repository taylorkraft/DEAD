class Beer < ApplicationRecord
  belongs_to :brewery
  belongs_to :user #creator, singular user instances
  has_many :ratings
  has_many :users, through: :ratings #people who have rated beers
end
