class Payment < ActiveRecord::Base
	belongs_to :team

	monetize :amount_cents

	scope :paid_entirely, -> {where('paid_in_full = ?', true)}
	scope :outstanding, -> {where('paid_in_full = ?', false)}

	def paid_amount
		return Money.new("5000", "USD")
	end
end
