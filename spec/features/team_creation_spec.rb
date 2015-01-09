require "rails_helper"

feature "team creation" do
	scenario "a non-signed-in user tries to create a new team" do 
		visit "/teams/new"

		expect(page).to have_content("You need to sign in or sign up before continuing")
	end

	scenario "a signed-in user creates a new team" do
		user = FactoryGirl.create(:user)
		visit "/users/sign_in"

		fill_in "Email", :with => "test@dgs.com"
		fill_in "Password", :with => "fooman123"

		click_button "Log in"

		visit "/teams/new"

		expect(page).to have_content("New team")

		fill_in "Name", :with => "Bruises"
		fill_in "Location", :with => "Boston, MA"

		click_button "Create team"
		expect(page).to have_content("Bruises")

		team = Team.last
		expect(team).to have_attributes(name: "Bruises")

		roster = TeamRoster.last
		expect(roster).to have_attributes(name: "Bruises #{Time.now.year}", current: true)

		captain = Roster.last
		expect(captain).to have_attributes(user_id: user.id, captain: true)

	end
end