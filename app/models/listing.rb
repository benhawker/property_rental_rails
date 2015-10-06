class Listing < ActiveRecord::Base
	belongs_to :user

	validates :name, length: {minimum: 3}
end
