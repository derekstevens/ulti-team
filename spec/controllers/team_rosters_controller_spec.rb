require 'rails_helper'

RSpec.describe TeamRostersController, :type => :controller do
	describe 'GET #index' do 
		it "renders the :index templete with all team_rosters for a specific team" do
			team_roster = FactoryGirl.create(:team_roster)

			2.times { FactoryGirl.create(:team_roster, team: team_roster.team) }

			get :index, team_id: team_roster.team.id

			expect(assigns(:team_rosters).count).to eq(3)
		end
		
	end

	describe 'GET #show' do 
		it "assigns the requested team_roster to @team_roster" do 
			team_roster = FactoryGirl.create(:team_roster)
			get :show, id: team_roster, team_id: team_roster.team
			expect(assigns(:team_roster)).to eq team_roster
		end
		it "renders the :show template" do 
			team_roster = FactoryGirl.create(:team_roster)
			get :show, id: team_roster, team_id: team_roster.team
			expect(response).to render_template :show
		end
	end
end
