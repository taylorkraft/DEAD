class Beer < ApplicationRecord
  belongs_to :brewery
  belongs_to :user #creator, singular user instances
  has_many :ratings
  has_many :users, through: :ratings #people who have rated beers
  # accepts_nested_attributes_for :brewery
<<<<<<< HEAD

  validates :name, presence: true
  # validate :not_a_duplicate

  validates :name, uniqueness: {scope: :brewery, message: "has already been added"}

=======
  has_one_attached :image

  validates :name, presence: true
  validate :not_a_duplicate

  scope :order_by_rating, -> {left_joins(:ratings).group(:id).order('avg(stars) desc')} #scope methods apply to whole class/collection
  
>>>>>>> updated_master
  def self.alpha
    order(:name)
  end

  def brewery_attributes=(attributes)
<<<<<<< HEAD
    brewery = Brewery.find_or_create_by(atrributes) if !attributes['name'].empty?
  end

#  def not_a_duplicate
#if there is already a beer with that name and brewery, throw error
#   if Beer.find_by(name: name, brewery_id: brewery_id)
#     errors.add(:name, 'has already been added by that brewery')
#   end
#  end
=======
    self.brewery = Brewery.find_or_create_by(attributes) if !attributes['name'].empty?
    self.brewery
  end
  
  def not_a_duplicate
    if Beer.find_by(name: name, brewery_id: brewery_id)
      errors.add(:style, 'has already been added by that brewery')
    end
  end
>>>>>>> updated_master

  def beer_and_brewery
    "#{brewery.name} - #{name}"
  end
end
