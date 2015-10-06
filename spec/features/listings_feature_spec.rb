require 'rails_helper'

def sign_up(user)
	visit '/' 
	click_link 'Sign up'
	fill_in 'Email', with: 'test@example.com'
	fill_in 'Password', with: 'testtest'
	fill_in 'Password confirmation', with: 'testtest'
	click_button 'Sign up'
end

def sign_out
	click_link 'Sign out'
end

def sign_in(user)
	visit '/' 
	save_and_open_page
	click_link "Sign in"
	fill_in "user[email]", with: "test@test.com"
	fill_in "user[password]", with: "password"
	click_button 'Log in'
end

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

  	let!(:user){ User.create }

  	scenario 'prompts user to fill out form, the displays their new listing' do
  		sign_up(user)
  		visit '/'
  		click_link 'Add a listing'
  		fill_in "listing[name]", with: "Test Event"
  		click_button "Create Listing"
  		expect(page).to have_content "Test Event"
  		expect(current_path).to eq '/'
  	end

  	context 'an invalid listing' do
	    it 'name/title must be at least 3 chars' do
	    	sign_up(user)
				visit '/'
	  		click_link 'Add a listing'
	  		fill_in "listing[name]", with: ".."
	  		click_button "Create Listing"
	      expect(page).not_to have_css 'h2', text: '..'
	      expect(page).to have_content 'error'
	    end
	  end
  end

  context 'viewing listings' do
  	let!(:test_listing){ Listing.create(name:'Test Listing') }

  	scenario 'lets a user view a listing' do
  		visit '/'
  		click_link 'Test Listing'
  		expect(page).to have_content 'Test Listing'
  		expect(current_path).to eq "/listings/#{test_listing.id}"
  	end
  end

  context 'editing listings' do
  	before { Listing.create name: "Test Listing" }
  	let!(:user){ User.create }

  	scenario 'let a user edit a listing' do
  		sign_up(user)
  		visit '/'
  		click_link 'Edit Test Listing'
  		fill_in "listing[name]", with: "Test Listing 2"
  		click_button "Update listing"
  		expect(page).to have_content "Test Listing 2"
  		expect(current_path).to eq '/'
  	end
  end

  context 'deleting restaurants' do
  	before { Listing.create name: "Test Listing" }
  	let!(:user){ User.create }

  	scenario 'removes a listing when user clicks delete link' do
  		sign_up(user)
  		visit '/'
  		click_link 'Delete Test Listing'
  		expect(page).to have_content 'Listing successfully deleted'
  		expect(page).not_to have_content "Test Listing"
  	end
  end
end