require 'rails_helper'

RSpec.describe PracticesController, :type => :controller do
	describe 'GET #index' do 
		it "renders the :index templete with all practices for a specific team" do
			team = FactoryGirl.create(:team)

			2.times { FactoryGirl.create(:practice, team: team) }

			get :index, team_id: team.id

			expect(assigns(:practices).count).to eq(2)
		end
		it "does not render the practices of other teams" do 
			team = FactoryGirl.create(:team)
			team2 = FactoryGirl.create(:team)
			2.times { FactoryGirl.create(:practice, team: team) }
			2.times { FactoryGirl.create(:practice, team: team2) }

			get :index, team_id: team.id

			expect(assigns(:practices).count).to eq(2)
		end
	end

	describe 'GET #show' do 
		it "assigns the requested practice to @practice" do 
			practice = FactoryGirl.create(:practice)
			get :show, id: practice, team_id: practice.team
			expect(assigns(:practice)).to eq practice
		end
		it "renders the :show template" do 
			practice = FactoryGirl.create(:practice)
			get :show, id: practice, team_id: practice.team
			expect(response).to render_template :show
		end
	end

	describe 'GET #new' do 
		it "assigns a new practice to @practice"
		it "renders the :new template"
	end

	describe 'GET #edit' do 
		it "assigns the requested practice to @practice"
		it "redners the :edit template"
	end

	describe 'POST #create' do 
		context "with valid attributes" do 
			it "saves the new practice in the database"
			it "redirects to practices#show"
		end

		context "with invalid attributes" do 
			it "does not save the new practice in the database"
			it "re-renders the :new template"
		end
	end

	describe 'PATCH #update' do 
		context "with valid attributes" do 
			it "updates practice in the database"
			it "redirects to practices#show"
		end

		context "with invalid attributes" do 
			it "does not update the practice in the database"
			it "re-renders the :edit template"
		end
	end

	describe 'DELETE #destroy' do
		it "deletes the practice from the database"
		it "redirects to the correct team#show"
	end
end
