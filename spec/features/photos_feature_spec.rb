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

feature 'photos' do
  context 'user can add a photo to their listing' do

  	let!(:user){ User.create }

    scenario 'should display a prompt to add a photo' do
      visit '/'
      sign_up(user)
      visit '/'
  		click_link 'Add a listing'
  		fill_in "listing[name]", with: "Test Event"
  		click_button "Create Listing"
  		click_link "Add Photos"
  		attach_file 'photo[image]', "spec/sample_images/1.jpg"
    	click_button "Add photo"
    end
  end
end