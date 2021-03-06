class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :all_subs


  def current_user
    @current_user ||= User.where(session_token: session[:session_token]).take
  end

  def log_in!
    session[:session_token] = @user.reset_session_token!
  end

  def log_out!
    @user.reset_session_token!
    session[:session_token] = nil
  end

  def all_subs
    Sub.all
  end

end
