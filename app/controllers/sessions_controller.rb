class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create, :login]
    before_action :deleted?, only: [:create]

    def new
    end

    def login
      if logged_in?
        redirect_to home_path
      else
        redirect_to new_session_path
      end 
    end
  
    def create
        user = Profile.where('lower(email) = ?', params[:email].downcase).first
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to home_path, notice: "Logged In"
        else
            flash.now[:alert] = "Email or password invalid"
            render "new"
        end
    end  
  
    def destroy
        session[:user_id] = nil
        redirect_to root_url, notice: "Logged Out"
    end

    private
      def deleted?
        user = Profile.where('lower(email) = ?', params[:email].downcase).first
        if user && (user.userable_type.to_str == "Teacher" || user.userable_type.to_str == "Student")
          if user.userable.is_deleted
            flash.now[:alert] = "User deleted"
            render "new"
          end
        end
      end
end
