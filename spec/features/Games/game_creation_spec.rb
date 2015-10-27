require 'rails_helper'

feature "game creation" do
	scenario "a captain creates a game" do  
		roster = FactoryGirl.create(:captain)
		user = roster.user
		team = roster.team_roster.team

		visit 'users/sign_in'

		fill_in "Email", :with => user.email
		fill_in "Password", :with => user.password
		click_button 'Log In'

		visit "teams/#{team.id}/games/new"

		fill_in "Location", :with => "Cambridge"
		fill_in "Game date", :with => Date.today

		click_button 'Create Game'

		expect(page).to have_content("Cambridge")
		expect(page).to have_content(Date.today.strftime("%^a, %^b %d"))
	end

	scenario "a player cannot create a game" do

	end 
end