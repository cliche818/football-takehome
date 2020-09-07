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

    it 'should respond to csv format' do
      get :index, params: { format: 'csv' }
      expect(response.header['Content-Type']).to include 'text/csv'
    end

    describe 'sorting' do
      it 'should return a list of players order by the column and sort order' do
        create(:player_rushing_stat, total_rushing_yards: 7, player_name: 'second')
        create(:player_rushing_stat, total_rushing_yards: 10, player_name: 'first')

        get :index, params: { sort_column: 'total_rushing_yards', sort_order: 'desc' }

        player_rushing_stats = assigns(:player_rushing_stats)
        expect(player_rushing_stats.count).to eq(2)
        expect(player_rushing_stats.first.player_name).to eq('first')
        expect(player_rushing_stats.last.player_name).to eq('second')
      end

      it 'should not set the order if the sort order is not valid' do
        create(:player_rushing_stat, player_name: 'first')
        create(:player_rushing_stat, player_name: 'second')

        get :index, params: { sort_column: 'total_rushing_yards', sort_order: 'not_valid' }

        player_rushing_stats = assigns(:player_rushing_stats)
        expect(player_rushing_stats.count).to eq(2)
        expect(player_rushing_stats.first.player_name).to eq('first')
        expect(player_rushing_stats.last.player_name).to eq('second')
      end

      it 'should not set the order if the sort column is not valid' do
        create(:player_rushing_stat, player_name: 'first')
        create(:player_rushing_stat, player_name: 'second')

        get :index, params: { sort_column: 'not_valid', sort_order: 'asc' }

        player_rushing_stats = assigns(:player_rushing_stats)
        expect(player_rushing_stats.count).to eq(2)
        expect(player_rushing_stats.first.player_name).to eq('first')
        expect(player_rushing_stats.last.player_name).to eq('second')
      end
    end
  end
end
