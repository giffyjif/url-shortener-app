class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate_user!
    flash[:warning] = "Must be logged in to complete this action!"
    redirect_to '/index' unless current_user
  end

  def authenticate_admin!
    redirect_to '/index' unless current_user && current_user.admin
  end
end
raise ActionController::RoutingError.new('Not Found')
