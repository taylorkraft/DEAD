class Brewery < ApplicationRecord
  has_many :beers
  # validates :name, presence: true, uniquness: true
end
