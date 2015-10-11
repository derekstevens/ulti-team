require 'rails_helper'

RSpec.describe GamesController, :type => :controller do

	describe 'GET #index' do 
		it "renders the :index templete with all games for a specific team" do
			team = FactoryGirl.create(:team)

			2.times { FactoryGirl.create(:game, team: team) }

			get :index, team_id: team.id

			expect(assigns(:games).count).to eq(2)
		end
		it "does not render the games of other teams" do 
			team = FactoryGirl.create(:team)
			team2 = FactoryGirl.create(:team)
			2.times { FactoryGirl.create(:game, team: team) }
			2.times { FactoryGirl.create(:game, team: team2) }

			get :index, team_id: team.id

			expect(assigns(:games).count).to eq(2)
		end
	end

	describe 'GET #show' do 
		it "assigns the requested game to @game" do 
			game = FactoryGirl.create(:game)
			get :show, id: game, team_id: game.team
			expect(assigns(:game)).to eq game
		end
		it "renders the :show template" do 
			game = FactoryGirl.create(:game)
			get :show, id: game, team_id: game.team
			expect(response).to render_template :show
		end
	end

	describe 'GET #new' do 
		it "assigns a new Game to @game"
		it "renders the :new template"
	end

	describe 'GET #edit' do 
		it "assigns the requested game to @game"
		it "redners the :edit template"
	end

	describe 'POST #create' do 
		context "with valid attributes" do 
			it "saves the new game in the database"
			it "redirects to games#show"
		end

		context "with invalid attributes" do 
			it "does not save the new game in the database"
			it "re-renders the :new template"
		end
	end

	describe 'PATCH #update' do 
		context "with valid attributes" do 
			it "updates game in the database"
			it "redirects to games#show"
		end

		context "with invalid attributes" do 
			it "does not update the game in the database"
			it "re-renders the :edit template"
		end
	end

	describe 'DELETE #destroy' do
		it "deletes the game from the database"
		it "redirects to the correct team#show"
	end
end
