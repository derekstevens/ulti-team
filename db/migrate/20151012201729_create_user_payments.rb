class CreateUserPayments < ActiveRecord::Migration
  def change
    create_table :user_payments do |t|

    	t.references :user
    	t.references :payment
    	t.monetize :amount_due
    	t.monetize :amount_paid, default: 0

      t.timestamps null: false
    end
  end
end
