require 'rails_helper'

feature 'profile edits' do 
	scenario 'a current user wants to edit their profile' do
		user = FactoryGirl.create(:user)

		visit 'users/sign_in'

		fill_in "Email", :with => user.email
		fill_in "Password", :with => user.password
		click_button 'Log In'

		visit "users/#{user.id}"

		expect(page).to have_content("Bob Smith")

		visit "/users/edit"

		expect(page).to have_content("Edit Profile")

		fill_in "First name", :with => "Derek"
		fill_in "Last name", :with => "Stevens"

		click_button "Update"

		expect(page).to have_content("Derek Stevens")
	end
end