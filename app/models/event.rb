class Event < ActiveRecord::Base
	belongs_to :team
	belongs_to :created_by_user, :class_name => 'User'

	validates :location, presence: true
	validates :event_date, presence: true
	validates :description, presence: true

	def start_time
		self.event_date
	end
end
