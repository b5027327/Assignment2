class IphonesController < ApplicationController
	before_action :authorize, :only => [ :create]
	def index
		#@iphones=Iphone.all
		@iphones = Iphone.paginate(:page=>params[:page],per_page:3)
	end
	def new
		@profile=Profile.new
		@product=Product.new
	end
	def show
		@iphone=Iphone.find(params[:id])
	end
	def create
	# render plain: params[:product] .inspect
	# @iphone=Iphone.new(iphone_params)
	# @iphone.save
	# redirect_to @iphone
	@iphone = Iphone.new(iphone_params)
		if @iphone.save
			redirect_to iphones_path, notice:
			"You have successfully added an iPhone review!"
		else
			redirect_to iphones_path, alert:
			"You need to be signed in to add a review."
		end
	end
	def update
	@iphone=Iphone.find(params[:id])
		if @iphone.update(iphone_params)
		redirect_to @iphone
		else
		render 'edit'
		end
	end
	def edit
		@iphone=Iphone.find(params[:id])
	end
	def destroy
		@iphone=Iphone.find(params[:id])
		@iphone.destroy
		redirect_to iphones_path
	end
	private
	def iphone_params
	params.require(:iphone).permit(:profile_id, :product_id, :author, :rating, :review, :date)
	end
end
