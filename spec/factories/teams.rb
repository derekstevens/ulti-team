require 'faker'

FactoryGirl.define do
  factory :team do
    name { Faker::Lorem.word }
    location {Faker::Address.city}
  end

end
