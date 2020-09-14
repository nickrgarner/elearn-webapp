class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authorized
    helper_method :current_user
    helper_method :logged_in?
  
    def current_user
      if session[:user_id]
        @current_user ||= Profile.find(session[:user_id])
      else
        @current_user = nil
      end
    end

    def logged_in?
    	!current_user.nil?
    end 

    def authorized
    	flash[:alert] = "Please Log in"
    	redirect_to root_url unless logged_in?
    end
  end
  