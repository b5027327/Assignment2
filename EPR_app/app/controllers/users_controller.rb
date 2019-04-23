class UsersController < ApplicationController
	def index
	end
	def new
		@user=User.new
 	end
	def create
		@user=User.new(user_params)
 		if @user.save
 			redirect_to new_session_path, notice:
 			"Welcome #{@user.userid} to Electronic Product Review!"
 		else
 			render 'new'
 		end
	end
	private
	def user_params
		params.require(:user).permit(:userid, :email, :password, :password_confirmation)
	end
end