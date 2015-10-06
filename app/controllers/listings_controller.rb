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

  def listing_params
    params.require(:listing).permit(:name)
  end

end
