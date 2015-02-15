class Practice < ActiveRecord::Base
	belongs_to :team

	validates :location, :practice_date, presence: true
	validates :practice_date, schedule: true 
end
