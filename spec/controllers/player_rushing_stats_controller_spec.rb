require 'rails_helper'

RSpec.describe PlayerRushingStatsController, type: :controller do
  describe 'GET #index' do
    it 'should return a list of players that matches the name' do
      create(:player_rushing_stat)
      create(:player_rushing_stat, player_name: 'ABCD DEFG')

      get :index, params: { player_name: 'ABC' }
      player_rushing_stats = assigns(:player_rushing_stats)

      expect(player_rushing_stats.count).to eq(1)
      expect(player_rushing_stats.first.player_name).to eq('ABCD DEFG')
      expect(response).to render_template('index')
    end
  end

end
