class ListingsController < ApplicationController

	def index
		@listings = Listing.all
	end

	def new
		@listing = Listing.new
	end

	def create
    @listing = Listing.new(listing_params)
		if @listing.save
  		redirect_to root_path
		else
  		render 'new'
		end
  end

  def show
  	@listing = Listing.find(params[:id])
  end

  def edit
  	@listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)

    redirect_to '/'
  end

  def destroy
  	@listing = Listing.find(params[:id])
  	@listing.destroy
  	flash[:notice] = 'Listing successfully deleted'
  	redirect_to '/'
  end

  def listing_params
    params.require(:listing).permit(:name)
  end

end
