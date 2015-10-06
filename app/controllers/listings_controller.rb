class ListingsController < ApplicationController

	def index
		@listings = Listing.all
	end

	def new

	end

	def create
    Listing.create(listing_params)
    redirect_to '/'
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

  def listing_params
    params.require(:listing).permit(:name)
  end

end
