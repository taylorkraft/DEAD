class Beer < ApplicationRecord
  belongs_to :brewery
  belongs_to :user #creator, singular user instances
  has_many :ratings
  has_many :users, through: :ratings #people who have rated beers
  # accepts_nested_attributes_for :brewery
  has_one_attached :image

  validates :name, presence: true
  validate :not_a_duplicate

  scope :order_by_rating, -> {left_joins(:ratings).group(:id).order('avg(stars) desc')} #scope methods apply to whole class/collection
  
  def not_a_duplicate
    if Beer.find_by(name: name, brewery_id: brewery_id)
      errors.add(:style, 'has already been added by that brewery')
    end
  end

  def self.alpha
    order(:name)
  end

  def brewery_attributes=(attributes)
    self.brewery = Brewery.find_or_create_by(attributes) if !attributes['name'].empty?
    self.brewery
  end

  def beer_and_brewery
    "#{brewery.name} - #{name}"
  end
end
