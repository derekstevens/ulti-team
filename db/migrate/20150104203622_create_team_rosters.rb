class CreateTeamRosters < ActiveRecord::Migration
  def change
    create_table :team_rosters do |t|
    	t.string :name

    	t.references :team
      t.timestamps null: false
    end
  end
end
