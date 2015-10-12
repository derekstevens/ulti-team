class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
    	
    	t.references :team
    	t.monetize :amount
    	t.string :description
    	t.string :title
    	t.datetime :due_date
    	t.boolean :paid_in_full, default: false


      t.timestamps null: false
    end
  end
end
