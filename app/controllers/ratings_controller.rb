class RatingsController < ApplicationController

  def new
    if @beer = Beer.find_by_id(params[:beer_id]) #if nested
      @rating = @beer.ratings.build #allows rating to know about it's beer
    else
      @rating = Rating.new
    end
  end

  def create
    @rating = Rating.new(rating_params)
    @rating = current_user.ratings.build(rating_params)
    if @rating.save!
      redirect_to rating_path(@rating)
    else
      render :new
    end
  end

  def show
    @rating = Rating.find_by_id(params[:id])
  end

  def index
    if @beer = Beer.find_by_id(params[:beer_id]) #checks if it's nested and for valid beer id
      @ratings = @beer.ratings
    else
      #if it's not nested
      @ratings = Rating.all
    end
  end

  def rating_params
    params.require(:rating).permit(:stars, :title, :content, :beer_id)
  end
end
