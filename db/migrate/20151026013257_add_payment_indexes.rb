class AddPaymentIndexes < ActiveRecord::Migration
  def change
  	add_index :user_payments, :user_id
  	add_index :user_payments, :payment_id
  end
end
