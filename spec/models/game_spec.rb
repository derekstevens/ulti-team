require 'rails_helper'

RSpec.describe Game, :type => :model do
  it "is valid with a location and game date" do 
  	game = FactoryGirl.create(:game)

  	expect(game).to be_valid
  end

  it "is invalid without a location" do 
  	game = FactoryGirl.build(:game, location: nil)

  	expect(game).to_not be_valid
  end

  it "is invalid without a game date" do 
  	game = FactoryGirl.build(:game, game_date: nil)

  	expect(game).to_not be_valid
  end

  it "is invalid for 1 team to have 2 games with same game date" do 
  	game1 = FactoryGirl.create(:game, game_date: Time.now.middle_of_day)
  	team = game1.team 

  	expect(FactoryGirl.build(:game, game_date: Time.now.middle_of_day, team: team)).to_not be_valid
  end

  it "is valid for 2 teams to have 2 games with same game date" do 
  	game1 = FactoryGirl.create(:game, game_date: Time.now.middle_of_day)
  	team = FactoryGirl.create(:team)

  	expect(FactoryGirl.build(:game, game_date: Time.now.middle_of_day, team: team)).to be_valid
  end

  it "is invalid for 1 team to have a game and practice with the same date" do 

  end
end
