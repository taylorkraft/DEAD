class RatingsController < ApplicationController

  def new
    @beer = Beer.find_by_id(params[:beer_id])
    @rating = @beer.ratings.build
  end

  def create
    @rating= Rating.create(rating_params)
    redirect_to rating_path(@rating)
  end

  def show
  
  end

  def index
  end

  def rating_params
    params.require(:rating).permit(:stars, :title, :content, :beer_id)
  end
end
