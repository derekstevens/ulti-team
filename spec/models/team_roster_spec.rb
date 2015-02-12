require 'rails_helper'

RSpec.describe TeamRoster, :type => :model do
  it "is valid with an email and a password" do 
    team_roster = FactoryGirl.create(:team_roster_with_players)

    expect(team_roster.rosters.count).to eq(5) 
  end
end
