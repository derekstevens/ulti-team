class MoreFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :location, :string
  	add_column :users, :date_of_birth, :datetime
  	add_column :users, :is_female, :boolean, default: false
  end
end
