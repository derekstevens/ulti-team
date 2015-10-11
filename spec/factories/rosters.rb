FactoryGirl.define do
  factory :roster do
    association :team_roster
    association :user

    captain false

    factory :captain do 
    	captain true
    end
  end

end
