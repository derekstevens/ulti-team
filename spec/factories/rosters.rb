FactoryGirl.define do
  factory :roster do
    association :team_roster
    association :user

    captain false
  end

end
