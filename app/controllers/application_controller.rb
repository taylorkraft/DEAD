class ApplicationController < ActionController::Base
  #add helper methods from sinatra project for login
  helper_method :current_user, :logged_in?

  private


  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
end
