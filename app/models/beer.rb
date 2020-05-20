class Beer < ApplicationRecord
  belongs_to :brewery
  belongs_to :user #creator, singular user instances
  has_many :ratings
  has_many :users, through: :ratings #people who have rated beers
  has_one_attached :image

  validates :name, presence: true, uniqueness: true

  scope :order_by_rating, -> {left_joins(:ratings).group(:id).order('avg(stars) desc')} 
  #scope methods apply to whole class/collection
  #groups rating by id and orders by rating
  
  def self.alpha
    order(:name)
  end

  def brewery_attributes=(attributes)
    self.brewery = Brewery.find_or_create_by(attributes) if !attributes['name'].empty? #if brewery doesn't already exist
    self.brewery
  end

  def beer_and_brewery
    "#{brewery.name} - #{name}"
  end
end
