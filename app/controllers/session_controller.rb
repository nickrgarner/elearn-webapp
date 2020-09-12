class SessionController < ApplicationController
  def new
  end

  def create
  	person = Profile.find_by_email(params[:email])
  	if person && person.authenticate(params[:password])
  			session[:person_id] = person.id
  			redirect_to home_path, notice: "Logged In!"
  		else
  			flash.now[:alert] = "Email or password invalid"
  			render "new"
  		end
  end


  def destroy
  	session[:person_id] = nil
  	redirect_to root_url, notice: "Logged Out"
  end
end
