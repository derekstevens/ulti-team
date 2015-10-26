class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.references :team
    	t.references :created_by_user

    	t.string :location
    	t.time :start_time
    	t.time :end_time
    	t.date :event_date

      t.timestamps null: false
    end
  end
end
