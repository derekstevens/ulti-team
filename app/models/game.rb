class Game < ActiveRecord::Base
	belongs_to :team

	validates :location, presence: true
	validates :game_date, presence: true
	validates :game_date, schedule: true 

	scope :wins, -> { where('team_score > opponent_score') }
	scope :loses, -> { where('team_score < opponent_score') }

end
