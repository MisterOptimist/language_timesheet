require 'spec_helper'

feature 'User permissions' do 
	scenario "views user menu" do 
		user = create(:user)
		sign_in user

		expect(page).to have_content "Welcome"
          	expect(page).to have_link "Home"
          	expect(page).to have_link "Activity Feed"
          	expect(page).to have_link "Timesheets"
          	expect(page).to have_link "Forum"
          	expect(page).to have_link "Resources"
	end 
	scenario "Cannot view admin menu" do 
		user = create(:user)
		sign_in user

		expect(page).to_not have_link "Check Hours"
          	expect(page).to_not have_link "Staff Members"
          	expect(page).to_not have_link "Manage Forums"
          	expect(page).to_not have_link "Manage Word of the Day"
          	expect(page).to_not have_link "Settings"
	end
end

