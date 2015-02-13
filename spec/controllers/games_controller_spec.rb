require 'rails_helper'

RSpec.describe GamesController, :type => :controller do
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
