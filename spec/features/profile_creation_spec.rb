require "rails_helper"

feature "Profile creation" do
	scenario "A new user signs up" do 
		visit "/users/sign_up"

		fill_in "Email", :with => "test@dgs.com"
		fill_in "Password", :with => "fooman123"
		fill_in "Password confirmation", :with => "fooman123"
		click_button "Sign up"

		expect(page).to have_content("Edit Profile")

		fill_in "First name", :with => "Bob"
		fill_in "Last name", :with => "Smith"

		click_button "Update"

		expect(page).to have_content("Bob Smith")
	end
	 

end