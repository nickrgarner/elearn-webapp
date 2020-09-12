class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if session[:person_id]
      @current_user ||= Profile.find(session[:person_id])
    else
      @current_user = nil
    end
  end
end
