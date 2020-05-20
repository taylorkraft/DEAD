class RatingsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    if @beer = Beer.find_by_id(params[:beer_id]) #if nested
      @rating = @beer.ratings.build
    else
      @rating = Rating.new 
    end
  end

  def create
    @rating = current_user.ratings.build(rating_params) #associates user to their rating
    if @rating.save
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
      @ratings = @beer.ratings #all of that beer's ratings
    else
      #if it's not nested
      @ratings = Rating.all
    end
  end

  def rating_params
    params.require(:rating).permit(:beer_id, :stars, :title, :content)
  end
end
