class Game < ActiveRecord::Base
	belongs_to :team

	validates :location, presence: true
	validates :game_date, presence: true
	validates :game_date, schedule: true 

	scope :wins, -> { where('team_score > opponent_score') }
	scope :loses, -> { where('team_score < opponent_score') }
	scope :upcoming_games, -> { where('game_date >= ?', Time.current).order(:game_date) }
	scope :past_games, -> { where('game_date < ?', Time.current).order(game_date: :desc) }

	def start_time
		self.game_date
	end

end
