class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	private
	def current_user
		@current_user ||=User.find(session[ :user_id]) if session[ :user_id]
	end
	helper_method :current_user
	def authorize
		redirect_to new_session_path, alert: 'In order to add a review, please log in or sign up.' if current_user.nil?
	end
end
