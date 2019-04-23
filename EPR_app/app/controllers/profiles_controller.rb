class ProfilesController < ApplicationController
	def index
		@profiles=Profile.all
	end
	def new
	end
	def show
		@profile=Profile.find(params[:id])
	end
	def create
	# render plain: params[:product] .inspect
	@profile=Profile.new(profile_params)
	@profile.save
	redirect_to @profile
	end
	def update
	@profile=Profile.find(params[:id])
		if @profile.update(profile_params)
		redirect_to @profile
		else
		render 'edit'
		end
	end
	def edit
		@profile=Profile.find(params[:id])
	end
	def destroy
		@profile=Profile.find(params[:id])
		@profile.destroy
		redirect_to profiles_path
	end
	private
	def profile_params
	params.require(:profile).permit(:fname, :lname, :date, :address, :city, :county, :photo)
	end
end
