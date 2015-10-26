class UserPaymentsController < ApplicationController
	def new
		@userpayment = UserPayment.new
	end

	def create
		@userpayment = UserPayment.new userpayment_params
	end

	def update_amount_paid
		@userpayment = UserPayment.find params[:user_payment][:id]
		payment = Payment.find params[:user_payment][:payment_id]
		team = Team.find params[:user_payment][:team_id]

		@userpayment.amount_paid = params[:user_payment][:amount_paid]
		@userpayment.save

		redirect_to team_payment_path(team, payment)
	end

	private

		def userpayment_params
			params.require(:userpayment).permit(:amount_paid, :amount_due)
		end
end
