class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :photos, dependent: :destroy
	has_many :bookings, dependent: :destroy

	accepts_nested_attributes_for :photos, :reject_if => lambda { |t| t['photo'].nil? }

	validates :name, length: {minimum: 3}
end
