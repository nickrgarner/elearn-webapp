class UserMailer < ApplicationMailer
	default from: 'e-learn@GGM.edu'
	require 'securerandom'
	def signed_up_email
      @user = params[:user]
      @url = 'https://hidden-meadow-75629.herokuapp.com/'
      mail(to: @user.email, subject: 'Welcome to E-Learn!')
  end 
	def profile_updated_email
      @user = params[:user]
      @url = 'https://hidden-meadow-75629.herokuapp.com/'
      mail(to: @user.email, subject: 'Profile Updated for E-Learn')
  end 

  	def registration_email
  	  @user = params[:user]
  	  @course = params[:course]
  	  @discipline = Discipline.find(@course.discipline_id).name
  	  @url = 'https://hidden-meadow-75629.herokuapp.com/'
      mail(to: @user.email, subject: 'Successful Registration!')
  end

  	def new_student_email
      @user = params[:user].profile
      @course = params[:course]
      @discipline = Discipline.find(@course.discipline_id).name
      @url = 'https://hidden-meadow-75629.herokuapp.com/'
      mail(to: @user.email, subject: 'You Have A New Student!') 		
  	end


  	def OTP_email
  	  @user = params[:user]
  	  @key = SecureRandom.hex(5)
  	  @url = 'https://hidden-meadow-75629.herokuapp.com/'
      mail(to: @user.email, subject: '')
  end
end
