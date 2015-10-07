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
	click_link "Sign in"
	fill_in "user[email]", with: "test@test.com"
	fill_in "user[password]", with: "password"
	click_button 'Log in'
end

feature 'bookings' do
  context 'making a booking' do

  	let!(:user){ User.create }

  	before :each do
  		sign_up(user)
  		visit '/'
  		click_link 'Add a listing'
  		fill_in "listing[name]", with: "Test Event"
  		click_button "Create Listing"
  	end

    scenario 'should display a prompt to make a booking' do
      visit '/'
      click_link "Test Event"
      expect(page).to have_content 'Make a Booking'
    end

    scenario 'user can their dates, write message and send booking request' do
    	visit '/'
      click_link 'Test Event'
      click_link 'Make a Booking'
      expect(page).to have_content 'Select your dates'
    end
  end
end
