require 'rails_helper'

feature 'listings' do
  context 'no listings have been added' do
    scenario 'should display a prompt to add a listing' do
      visit '/'
      expect(page).to have_content 'No listings yet'
    end
  end

  context 'listings have been added' do
  	before do 
  		Listing.create(name: "Test House")
  	end

  	scenario 'display listings' do
  		visit '/'
  		expect(page).to have_content('Test House')
  		expect(page).not_to have_content('No listings yet')
  	end
  end

  context 'creating listings' do
  	scenario 'prompts user to fill out form, the displays their new listing' do
  		visit '/'
  		click_link 'Add a listing'
  		fill_in "listing[name]", with: "Test Event"
  		click_button "Create Listing"
  		expect(page).to have_content "Test Event"
  		expect(current_path).to eq '/'
  	end
  end
end