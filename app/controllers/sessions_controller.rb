class SessionsController < ApplicationController

  def welcome
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end

  def new
    @user = User.new
  end

  def create
    if params[:provider] == 'google_oauth2'
      @user = User.create_by_google_omniauth(auth)
<<<<<<< HEAD
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    
    @user = User.find_by(username: params[:user][:username]) #try to find user in the system
    # if @user && @user.authenticate(params[:user][:password]) 
    if @user.try(:authenticate, params[:user][:password]) #did we find a user and did they enter a valid password?
=======
>>>>>>> updated_master
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @user = User.find_by(username: params[:user][:username]) #try to find user in the system
      # if @user && @user.authenticate(params[:user][:password]) 
      if @user && @user.authenticate(params[:user][:password]) #did we find a user and did they enter a valid password?
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:error] = "Sorry, login failed. Please try again."
        redirect_to login_path
      end
    end
  end
<<<<<<< HEAD
end
=======

  def omniauth
    @user = User.create_by_google_omniauth(auth)

    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  private

    def auth
      request.env['omniauth.auth']
    end
>>>>>>> updated_master
end