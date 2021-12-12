require 'rails_helper'

RSpec.describe TeamRushingStatsController, type: :controller do
  describe 'GET #index' do
    it 'should render all team_rushing_stats' do
      create(:team_rushing_stat)
      get :index

      team_rushing_stats = assigns(:team_rushing_stats)
      expect(team_rushing_stats.count).to eq(1)
    end
  end
end