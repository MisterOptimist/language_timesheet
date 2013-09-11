require 'spec_helper'

feature 'Word management' do 
	scenario "adds a new word" do 
		admin = create(:admin)

		visit root_path
		click_link 'Log In'
		fill_in 'Email', with: admin.email
		fill_in 'Password', with: admin.password
		click_button('Sign in')

		expect(page).to have_content "Welcome"
		click_link('Manage Word of the Day')
		expect(page).to have_content "Edit"
	end

	scenario "can view a new word" do 
		user = create(:user)

		visit root_path
		click_link 'Log In'
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_button('Sign in')

		expect(page).to have_content "Welcome"
		
		expect(page).to_not have_content "Manage Word of the Day"
		click_link('Word of the Day')
		expect(page).to have_content "Listing Words"

	end

end