class User < ApplicationRecord
  has_many :ratings
  has_many :rated_beers, through: :ratings, source: :beer #we can't have a has_many and has_many, through: with the same name. source allows us to rename 'beers' to 'rated_beers' 

  has_many :beers #that they have created
end
