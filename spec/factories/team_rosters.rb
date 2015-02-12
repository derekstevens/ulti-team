FactoryGirl.define do
  factory :team_roster do
  	association :team
  	name { "#{Team.first.name} 2015" }

  	factory :team_roster_with_players do 
      after(:create) do |team_roster|
    		5.times do 
    			player = FactoryGirl.create(:user)
          FactoryGirl.create(:roster, team_roster: TeamRoster.first, user: player)
        end
      end
    end
  end

end
