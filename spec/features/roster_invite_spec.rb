require 'rails_helper'

feature "roster invite" do 
  scenario "a captain invites a single user" do 
    user = FactoryGirl.create(:user, email: "test@dgs.com", password: "fooman123", first_name: "Derek")
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
    team_roster = TeamRoster.last

    visit "/teams/#{team.id}/team_rosters/#{team_roster.id}"
    expect(page).to have_content("Bruises 2015")

    test_user = FactoryGirl.create(:user, email: "testderek@dgs.com")
    fill_in "Email", :with => "testderek@dgs.com"
    click_button "Add player"

    expect(page).to have_content("Derek")
    expect(page).to have_content("Bob")
  end

  scenario "a captain invites multiple users" do 
    user = FactoryGirl.create(:user, email: "test@dgs.com", password: "fooman123", first_name: "Derek")
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
    team_roster = TeamRoster.last

    visit "/teams/#{team.id}/team_rosters/#{team_roster.id}"
    expect(page).to have_content("Bruises 2015")

    test_user1 = FactoryGirl.create(:user, email: "testderek@dgs.com")
    test_user2 = FactoryGirl.create(:user, email: "testuser@dgs.com", first_name: "Joe")
    fill_in "Email", :with => "testderek@dgs.com, testuser@dgs.com"
    click_button "Add player"

    expect(page).to have_content("Derek")
    expect(page).to have_content("Bob")
    expect(page).to have_content("Joe")
  end
end