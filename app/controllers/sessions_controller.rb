class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]

    def new
    end
  
    def create
        user = Profile.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            if current_user.userable_type.to_str == "Admin"
              redirect_to admin_home_path, notice: "Logged In!"
            elsif current_user.userable_type.to_str == "Teacher"
              redirect_to teacher_home_path, notice: "Logged In!"
            elsif current_user.userable_type.to_str == "Student"
              redirect_to student_home_path, notice: "Logged In!"
            else
              flash[:alert] = "Error Logging in, please try again"
              redirect_to root_url 
          end
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
