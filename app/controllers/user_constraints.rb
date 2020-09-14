class UserConstraints < ApplicationController

	def initialize(user_type)
		@user_type = user_type
	end

	def matches?(request)
		# if !current_user(request).nil? # this is a patch to typing /home in address by while not logged in
	    @user_type == current_user(request).userable_type.to_str
	rescue
	end

	def current_user(request)
        Profile.find_by_id(request.session[:user_id])
    end
end