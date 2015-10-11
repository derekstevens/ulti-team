class CreateRosterInvites < ActiveRecord::Migration
  def change
    create_table :roster_invites do |t|
    	t.string :email
    	t.references :team_roster
    	t.references :sender
    	t.references :recipient
    	t.string :token
    	t.boolean :captain
    	
      t.timestamps null: false
    end
  end
end
