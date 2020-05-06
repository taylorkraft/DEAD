class BeersController < ApplicationController

  def new
    @beer = Beer.new
    @beer.build_brewery #associates a beer with brewery upon instantiation
  end

  def create
    @beer = Beer.new(beer_params)
    @beer.user_id = session[:user_id]
    if @beer.save
      redirect_to beer_path(@beer)
    else
      render :new
    end
  end

  def index
    @beers = Beer.all
  end
  
  def show
    @beer = Beer.find_by_id(params[:id])
  end


  private

  def beer_params
    params.require(:beer).permit(:name, :style, :ABV, :brewery_id, brewery_attributes: [:name])
  end
end
