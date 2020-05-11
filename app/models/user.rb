class User < ApplicationRecord
  has_many :ratings
  has_many :rated_beers, through: :ratings, source: :beer #we can't have a has_many and has_many, through: with the same name. source allows us to rename 'beers' to 'rated_beers' 

  has_many :beers #that they have created
  
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
<<<<<<< HEAD

=======
  
>>>>>>> updated_master
  has_secure_password #gives us authenticate method, validates password

  def self.create_by_google_omniauth(auth)
    self.find_or_create_by(username: auth[:info][:email]) do |u|
      u.password = SecureRandom.hex
    end
  end
end
