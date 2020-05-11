class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save #validates
      session[:user_id] = @user.id #sets sessions if valid user
      redirect_to user_path(@user)
    else
      render :new #renders new form if invalid
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email) #require object and permit any other params
  end
end
