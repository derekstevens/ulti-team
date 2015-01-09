class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
    	t.boolean :captain
    	t.references :team_roster
    	t.references :user
      t.timestamps null: false
    end
  end
end
