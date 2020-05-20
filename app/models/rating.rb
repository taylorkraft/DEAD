class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :beer

  validates :title, presence: true
  validates :stars, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}

  validates :beer, uniqueness: {scope: :user, message: "has aleady been rated by you"}
  #each user can only create one rating per beer
end
