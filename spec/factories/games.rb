require 'faker'

FactoryGirl.define do
  factory :game do
    association :team
    location { Faker::Address.city }
    game_date { Date.new(2015,1,01) }
    start_time { Time.now }

    factory :invalid_game do 
    	location nil
    end

    factory :win do 
    	team_score 15
      opponent_score 10
    end

    factory :lose do 
      team_score 10
      opponent_score 15
    end
  end

end
