class IwatchesController < ApplicationController
	before_action :authorize, :only => [ :create]
	def index
		#@iwatches=Iwatch.all
		@iwatches = Iwatch.paginate(:page=>params[:page],per_page:3)
	end
	def new
		@profile=Profile.new
		@product=Product.new
	end
	def show
		@iwatch=Iwatch.find(params[:id])
	end
	def create
	# render plain: params[:product] .inspect
	# @iwatch=Iwatch.new(iwatch_params)
	# @iwatch.save
	# redirect_to @iwatch
	@iwatch = Iwatch.new(iwatch_params)
		if @iwatch.save
			redirect_to iwatches_path, notice:
			"You have successfully added an Apple Watch review!"
		else
			redirect_to iwatches_path, alert:
			"You need to be signed in to add a review."
		end
	end
	def update
	@iwatch=Iwatch.find(params[:id])
		if @iwatch.update(iwatch_params)
		redirect_to @iwatch
		else
		render 'edit'
		end
	end
	def edit
		@iwatch=Iwatch.find(params[:id])
	end
	def destroy
		@iwatch=Iwatch.find(params[:id])
		@iwatch.destroy
		redirect_to iwatches_path
	end
	private
	def iwatch_params
	params.require(:iwatch).permit(:profile_id, :product_id, :author, :rating, :review, :date)
	end
end
