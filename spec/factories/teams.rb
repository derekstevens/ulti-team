require 'faker'

FactoryGirl.define do
  factory :team do
    name { Faker::Lorem.word }
    location {Faker::Address.city}
    team_admin_id { FactoryGirl.create(:user).id }
  end

end
