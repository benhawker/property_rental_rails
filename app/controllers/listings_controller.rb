class ListingsController < ApplicationController

	before_action :authenticate_user!, :except => [:index, :show]

	def index
		@listings = Listing.all
	end

	def new
		@listing = Listing.new
	end

	def create
    @user = current_user
    @listing = @user.listings.build(listing_params)
    if @listing.save
      redirect_to root_path
		else
  		render 'new'
		end
	end

  def show
  	@listing = Listing.find(params[:id])
    @photos = @listing.photos.all
  end

  def edit
  	@listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    redirect_to root_path
  end

  def destroy
  	@listing = Listing.find(params[:id])
  	@listing.destroy
  	flash[:notice] = 'Listing successfully deleted'
  	redirect_to root_path
  end

  def listing_params
    params.require(:listing).permit(:name, :city, :accomodates, 
    																:description, :beds, :baths, 
    																:price, :home_type, :address,
                                    :user_id)
  end

end
