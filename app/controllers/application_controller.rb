class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authorized
    helper_method :current_user
    helper_method :logged_in?
    helper_method :admin?
    helper_method :teacher?
    helper_method :student?
    helper_method :user_is?

  	def index
  		flash[:notice] = "Sorry that page was not found."
  		redirect_to home_path
    end
    
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

    def admin?
      if current_user.userable_type.to_str != "Admin"
        flash[:notice] = "Page Restricted"
      end
    	redirect_to home_path unless current_user.userable_type.to_str == "Admin"
    end

    def teacher?
      if current_user.userable_type.to_str != "Teacher"
        flash[:notice] = "Page Restricted"
      end
    	redirect_to home_path unless current_user.userable_type.to_str == "Teacher"
    end

    def student?
      if current_user.userable_type.to_str != "Student"
        flash[:notice] = "Page Restricted"
      end
    	redirect_to home_path unless current_user.userable_type.to_str == "Student"
    end

    def user_is?(type)
      current_user.userable_type.to_str == type
    end
  end
  