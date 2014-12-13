class AddFieldsToTeam < ActiveRecord::Migration
  def change
  	add_column :teams, :name, :string
  	add_column :teams, :location, :string
  	add_column :teams, :league, :string
  end
end
