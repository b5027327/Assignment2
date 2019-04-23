class SessionsController < ApplicationController
	def index
		#redirect_to static_pages_home_path, notice:
	end
	def new
	end
	def create
		user=User.find_by_userid(params[ :userid])
		if user && user.authenticate(params[ :password])
					session[ :user_id]=user.id
					redirect_to new_profile_path, notice:
					"Welcome #{user.userid}, you are now logged in!"
		else
			render 'new', alert:
			"Invalid username and/or password. Please try again."
		end
	end
	def destroy
		session[:user_id] = nil
		redirect_to root_path, notice:
		"You have successfully logged out. Goodbye!"
	end
end
