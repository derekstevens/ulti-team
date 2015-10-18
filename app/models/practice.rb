class Practice < ActiveRecord::Base
	belongs_to :team

	validates :location, :practice_date, presence: true
	validates :practice_date, schedule: true

	scope :upcoming_practices, -> { where('practice_date > ?', Time.current).order(practice_date: :desc) } 
	scope :past_practices, -> { where('practice_date < ?', Time.current).order(practice_date: :desc) }

	def start_time
		self.practice_date
	end
end
