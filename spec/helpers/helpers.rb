def sign_up(user)
	visit '/' 
	click_link 'Sign up'
	fill_in 'Email', with: 'test@example.com'
	fill_in 'Password', with: 'testtest'
	fill_in 'Password confirmation', with: 'testtest'
	click_button 'Sign up'
end

def sign_in(user)
	click_link "Sign in"
	fill_in "user[email]", with: "test@test.com"
	fill_in "user[password]", with: "password"
	click_button 'Sign in'
end