require 'faker'

FactoryGirl.define do
  factory :practice do
    association :team
    practice_date { Time.now }
    location { Faker::Address.city}

    factory :invalid_practice do 
    	location nil
    end
  end
end
