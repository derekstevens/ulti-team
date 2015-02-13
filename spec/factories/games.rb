require 'faker'

FactoryGirl.define do
  factory :game do
    association :team
    location { Faker::Address.city }
    game_date { Time.now }

    factory :invalid_game do 
    	location nil
    end
  end

end
