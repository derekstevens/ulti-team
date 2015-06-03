require 'rails_helper'

RSpec.describe Team, :type => :model do
	it "is valid with a name and location" do 
		team = Team.new(name: "Bruises", location: "Boston, MA", team_admin_id: 1);
		expect(team).to be_valid
	end

	it "is invalid without a name" do 
		team = Team.new(name: nil, location: "Boston, MA", team_admin_id: 1);
		expect(team).to_not be_valid
	end

	it "is invalid without a location" do 
		team = Team.new(name: "Bruises", location: nil);
		expect(team).to_not be_valid
	end

	it "is invalid without a team admin" do 
		team = Team.new(name: "Bruises", location: "Boston, MA", team_admin_id: nil)
		expect(team).to_not be_valid
	end

	
end
