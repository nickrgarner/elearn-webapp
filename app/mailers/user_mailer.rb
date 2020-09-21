class UserMailer < ApplicationMailer
	default from: 'e-learn@GGM.edu'

	def signed_up_email
      @user = params[:user]
      @url = 'https://hidden-meadow-75629.herokuapp.com/'
      mail(to: @user.email, subject: 'Welcome to E-Learn!')
  end 
end
