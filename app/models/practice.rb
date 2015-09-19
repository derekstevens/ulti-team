class Practice < ActiveRecord::Base
	belongs_to :team

	validates :location, :practice_date, presence: true
	validates :practice_date, schedule: true

	scope :upcoming_practices, -> { where('practice_date > ?', Date.today).order(practice_date: :desc) } 
end
