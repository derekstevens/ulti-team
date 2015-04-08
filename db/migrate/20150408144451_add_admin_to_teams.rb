class AddAdminToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :team_admin_id, :integer
  end
end
