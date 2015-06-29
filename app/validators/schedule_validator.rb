class ScheduleValidator < ActiveModel::EachValidator
	def validate_each(record, attribute, value)
		team = record.team
		team.practices.each do |practice|
			if value == practice.practice_date
				record.errors[:attribute] << "Practice already scheduled at this time."
			end
		end

		team.games.each do |game|
			if value == game.game_date
				record.errors[:attribute] << "Game already scheduled at this time."
			end
		end
	end
end