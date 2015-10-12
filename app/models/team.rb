class Team < ActiveRecord::Base
	has_many :team_rosters
	has_many :games
	has_many :practices
	has_many :payments
	
  belongs_to :team_admin, :class_name => 'User'
	
	validates :name, presence: true
	validates :location, presence: true
	validates :team_admin_id, presence: true

end
