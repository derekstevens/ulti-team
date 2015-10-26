class UserPayment < ActiveRecord::Base
	belongs_to :user
	belongs_to :payment

	monetize :amount_due_cents
	monetize :amount_paid_cents

	def paid_amount_ratio
		(self.amount_paid / self.amount_due) * 100
	end

end
