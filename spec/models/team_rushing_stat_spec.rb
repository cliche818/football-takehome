require 'rails_helper'

RSpec.describe 'TeamRushingStat' do
  describe '.create_records' do
    it 'should create a team_rushing_stat record from 2 player_rushing_stat' do
      create(:player_rushing_stat, player_name: 'player_1')
      create(:player_rushing_stat, player_name: 'player_2')

      TeamRushingStat.create_records

      expect(TeamRushingStat.count).to eq(1)
      team_rushing_stat = TeamRushingStat.first
      expect(team_rushing_stat.player_team).to eq('NO')
      expect(team_rushing_stat.rushing_attempts).to eq(410)
    end
  end
end