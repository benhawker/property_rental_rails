class PhotosController < ApplicationController

	def index

	end

	def new
		@listing = Listing.find(params[:listing_id])
		@photo = Photo.new
		# @photo = @listing.photo.build(photo_params)
	end

  def employer_params
    params.require(:photo).permit(:photo)
  end
end
