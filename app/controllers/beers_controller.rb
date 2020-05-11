class BeersController < ApplicationController

  def new
    @beer = Beer.new
    @beer.build_brewery #associates a beer with brewery upon instantiation
  end

  def create
    @beer = Beer.new(beer_params)
    @beer.user_id = session[:user_id]
    if @beer.save
      @beer.image.purge
      @beer.image.attach(params[:beer][:image]) #only stores to active storage if there is an image attached
      redirect_to beer_path(@beer)
    else
      @beer.build_brewery
      render :new
    end
  end

  def index
    @beers = Beer.order_by_rating.includes(:brewery) #only queries the database once
  end
  
  def show
    @beer = Beer.find_by_id(params[:id])
  end

  def edit
  end

  def update
  end


  private

  def beer_params
    params.require(:beer).permit(:name, :style, :ABV, :brewery_id, :image, brewery_attributes: [:name])
  end
end
