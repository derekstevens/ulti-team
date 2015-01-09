class RostersController < ApplicationController
	def new
		@roster = Roster.new
	end

	def create
		@roster = Roster.new roster_params
	end

	private

		def roster_params
			params.require(:roster).permit(:captain)
		end
end
