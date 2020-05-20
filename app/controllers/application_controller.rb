class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  def logged_in?
    !!session[:user_id]
  end

  def current_user #if the value to the left is nil or falsey give it the value to the right
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    #if value is established on the left, code to the right will not run
  end

  def redirect_if_not_logged_in
    redirect_to login_path if !logged_in?
  end
end
