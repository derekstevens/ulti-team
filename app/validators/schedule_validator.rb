class ScheduleValidator < ActiveModel::EachValidator
	def validate_each(record, attribute, value)
		team = record.team
		type = record.class.name.demodulize
		team.practices.each do |practice|
			if !(practice.class.name.demodulize == type && practice.id == record.id)
				if value == practice.practice_date
					record.errors[:attribute] << "Practice already scheduled at this time."
				end
			end
		end

		team.games.each do |game|
			if !(game.class.name.demodulize == type && game.id == record.id)
				if value == game.game_date
					record.errors[:attribute] << "Game already scheduled at this time."
				end
			end
		end
	end
end