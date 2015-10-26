class Payment < ActiveRecord::Base
	belongs_to :team
	has_many :user_payments

	validates :title, presence: true
	validates :due_date, presence: true
	validates :amount, presence: true

	monetize :amount_cents

	scope :paid_entirely, -> {where('paid_in_full = ?', true)}
	scope :outstanding, -> {where('paid_in_full = ?', false)}

	def paid_amount
		user_payments = UserPayment.where("payment_id = ?", self.id)
		amount_paid = Money.new("0", "USD")
		user_payments.each do |payment|
			amount_paid += payment.amount_paid
		end
		amount_paid
	end

	def paid_amount_ratio
		(paid_amount / self.amount) * 100
	end
end
