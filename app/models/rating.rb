class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :beer

  validates :title, presence: true
  validates :stars, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}

<<<<<<< HEAD
  validates :beer, uniqueness: {scope: :user, message: "has already been reviewed by you"}
=======
  validates :beer, uniqueness: {scope: :user, message: "has aleady been rated by you"}
>>>>>>> updated_master
end
