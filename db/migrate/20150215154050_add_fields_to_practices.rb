class AddFieldsToPractices < ActiveRecord::Migration
  def change
  	add_column :practices, :location, :string
  	add_column :practices, :practice_date, :datetime
  	add_column :practices, :team_id, :integer
  end
end
