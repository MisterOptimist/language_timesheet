require 'spec_helper'

feature 'Word management' do 
	scenario "adds a new word" do 
		admin = create(:admin)

		visit root_path
		click_button 'Log In'
		fill_in 'Email', with: admin.email
		fill_in 'Password', with: admin.password 
		click_button 'Log In'

		visit root_path
		expect{
			click_link 'Manage Word of the Day'
			click_link 'Add a New Word'
		}
	end
end