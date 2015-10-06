class PhotosController < ApplicationController

	def index

	end

	def new
		@listing = Listing.find(params[:listing_id])
		@photo = Photo.new
	end

	def create
		@listing = Listing.find(params[:listing_id])
		@photo = @listing.photos.build(photo_params)
			if @photo.save
				flash[:notice] = "Photo saved successfuly."
				redirect_to "/"
			else
				flash[:alert] = "Sorry but your photo was not saved."
				render 'new'
			end
	end

  def photo_params
    params.require(:photo).permit(:photo)
  end
end
