class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]

    def new
    end
  
    def create
        user = Profile.find_by_email(params[:email])
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
end
