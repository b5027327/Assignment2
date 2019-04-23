class IpadsController < ApplicationController
	before_action :authorize, :only => [ :create]
	def index
		#@ipads=Ipad.all
		@ipads = Ipad.paginate(:page=>params[:page],per_page:3)
	end
	def new
		@profile=Profile.new
		@product=Product.new
	end
	def show
		@ipad=Ipad.find(params[:id])
	end
	def create
	# render plain: params[:product] .inspect
	# @ipad=Ipad.new(ipad_params)
	# @ipad.save
	# redirect_to @ipad
	@ipad = Ipad.new(ipad_params)
		if @ipad.save
			redirect_to ipads_path, notice:
			"You have successfully added an iPad review!"
		else
			redirect_to ipads_path, alert:
			"You need to be signed in to add a review."
		end
	end
	def update
	@ipad=Ipad.find(params[:id])
		if @ipad.update(ipad_params)
		redirect_to @ipad
		else
		render 'edit'
		end
	end
	def edit
		@ipad=Ipad.find(params[:id])
	end
	def destroy
		@ipad=Ipad.find(params[:id])
		@ipad.destroy
		redirect_to ipads_path
	end
	private
	def ipad_params
	params.require(:ipad).permit(:profile_id, :product_id, :author, :rating, :review, :date)
	end
end
