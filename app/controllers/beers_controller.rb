class BeersController < ApplicationController
  before_action :set_beer, only:[:show, :edit, :update] #sets beer before form actions execute
  before_action :redirect_if_not_logged_in

  def new
    @beer = Beer.new
    @beer.build_brewery #associates a beer with brewery upon instantiation
  end

  def create
    @beer = Beer.new(beer_params)
    @beer.user_id = session[:user_id] #associates a user to beer

    if @beer.save #validates
      @beer.image.purge
      @beer.image.attach(params[:beer][:image]) #only stores to active storage if there is an image attached
      redirect_to beer_path(@beer)
    else
      @beer.build_brewery
      render :new
    end
  end

  def index
    if params[:name]
      @beers = Beer.where('name LIKE ?', "%#{params[:name]}%")
    else
      @beers = Beer.order_by_rating.includes(:brewery)
    #only queries the database once
    end
  end
  
  def show
    @beer = Beer.find_by_id(params[:id])
  end


  def edit
  end

  def update
    if @beer.update(beer_params)
      @beer.save
      redirect_to @beer
    else
      render :new
    end
  end


  private

  def beer_params
    params.require(:beer).permit(:name, :style, :ABV, :brewery_id, :user_id, brewery_attributes: [:name])
  end

  def set_beer
    @beer = Beer.find_by_id(params[:id])
    redirect_to beers_path if !@beer
  end
end
