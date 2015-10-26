class PaymentsController < ApplicationController
	before_filter :authenticate_captain!

	def index
		@team = Team.find params[:team_id]
		@payments = @team.payments
	end

	def show
		@team = Team.find params[:team_id]
		@payment = Payment.find params[:id]
	end

	def new
		@team = Team.find params[:team_id]
		@payment = Payment.new
	end

	def create
		@team = Team.find params[:team_id]
		@payment = Payment.new payment_params
		@payment.team_id = @team.id

		if @payment.save
			create_user_payments(@payment)
			redirect_to team_payment_path(@team, @payment)
		else
			render :new
		end
	end

	def edit
		@team = Team.find params[:team_id]
		@payment = Payment.find params[:id]
	end

	def update
		@team = Team.find params[:team_id]
		@payment = Payment.find params[:id]

		if @payment.update_attributes payment_params
			redirect_to team_payment_path(@team, @payment)
		else
			render :edit
		end
	end

	def destroy
		@team = Team.find params[:team_id]
		@payment = Payment.find params[:id]

		@payment.destroy
		redirect_to @team
	end

	private

		def payment_params
			params.require(:payment).permit(:amount, :due_date, :description, :title, :paid_in_full)
		end

		def create_user_payments(payment)
			team = payment.team
			current_roster = team.team_rosters.where("current = ?", true).first
			user_count = current_roster.rosters.count
			amount_due = payment.amount / user_count

			current_roster.rosters.each do |user|
				user_payment = UserPayment.new(amount_due: amount_due)
				user_payment.user_id = user.id
				user_payment.payment_id = payment.id
				user_payment.save
			end
		end

end
