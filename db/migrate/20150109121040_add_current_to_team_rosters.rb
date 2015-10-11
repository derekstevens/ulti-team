class AddCurrentToTeamRosters < ActiveRecord::Migration
  def change
  	add_column :team_rosters, :current, :boolean
  end
end
