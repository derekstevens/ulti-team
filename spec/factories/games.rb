require 'faker'

FactoryGirl.define do
  factory :game do
    association :team
    location { Faker::Address.city }
    game_date { Time.now }
  end

end
