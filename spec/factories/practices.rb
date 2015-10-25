require 'faker'

FactoryGirl.define do
  factory :practice do
    association :team
    practice_date { Time.now }
    location { Faker::Address.city}
    start_time { Time.now }
  	end_time { Time.now + 2.hours }

    factory :invalid_practice do 
    	location nil
    end
  end
end
