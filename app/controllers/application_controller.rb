class ApplicationController < ActionController::Base
  #add helper methods from sinatra project for login
  private

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
end
