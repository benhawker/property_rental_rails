class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :photos

	validates :name, length: {minimum: 3}
end
