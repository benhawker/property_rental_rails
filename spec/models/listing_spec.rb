require 'rails_helper'

RSpec.describe Listing, type: :model do
  it { should belong_to (:user) }
  it { should have_many (:photos) }
  it { should have_many (:bookings) }

  it 'is not valid with a name of less than three characters' do
  	listing = Listing.new(name: "..")
  	expect(listing).to have(1).error_on(:name)
  	expect(listing).not_to be_valid
	end
end
