class UserConstraints < ApplicationController

	def initialize(user_type)
		@user_type = user_type
	end

	def matches?(request)
		@user_type == current_user(request).userable_type.to_str
	end

	def current_user(request)
        Profile.find_by_id(request.session[:user_id])
    end
end