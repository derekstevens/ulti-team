require 'rails_helper'

RSpec.describe Practice, :type => :model do
  it "is valid with a location and practice date" do 
  	practice = FactoryGirl.create(:practice)

  	expect(practice).to be_valid
  end

  it "is invalid without a location" do 
  	practice = FactoryGirl.build(:practice, location: nil)

  	expect(practice).to_not be_valid
  end

  it "is invalid without a practice date" do 
  	practice = FactoryGirl.build(:practice, practice_date: nil)

  	expect(practice).to_not be_valid
  end

  it "is invalid for 1 team to have 2 practices with same practice date" do 
  	practice1 = FactoryGirl.create(:practice, practice_date: Time.now.middle_of_day)
  	team = practice1.team 

  	expect(FactoryGirl.create(:practice, practice_date: Time.now.middle_of_day, team: team)).to_not be_new_record
  end

  it "is valid for 2 teams to have 2 practices with same practice date" do 
  	practice1 = FactoryGirl.create(:practice, practice_date: Time.now.middle_of_day)
  	team = FactoryGirl.create(:team)

  	expect(FactoryGirl.create(:practice, practice_date: Time.now.middle_of_day, team: team)).to be_valid
  end

  it "is invalid for 1 team to have a practice and practice with the same date" do 
    practice = FactoryGirl.create(:practice, practice_date: Time.now.middle_of_day)

    expect(FactoryGirl.create(:practice, practice_date: Time.now.middle_of_day, team: practice.team)).to_not be_new_record
  end
end
