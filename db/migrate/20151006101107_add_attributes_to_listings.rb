class AddAttributesToListings < ActiveRecord::Migration
  def change
  	add_column :listings, :city, :string
  	add_column :listings, :accomodates, :integer
  	add_column :listings, :description, :text
  	add_column :listings, :beds, :integer
  	add_column :listings, :baths, :float
  	add_column :listings, :price, :float
  	add_column :listings, :home_type, :string
  	add_column :listings, :address, :string
  end
end
