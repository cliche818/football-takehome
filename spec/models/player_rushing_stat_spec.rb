require 'rails_helper'

RSpec.describe 'PlayerRushingStat' do
  describe '.import_json' do
    it 'should import a json file of player rushing stat' do
      file_path = Rails.root.to_s + '/spec/fixtures/rushing-test1.json'

      PlayerRushingStat.import_json(file_path)

      expect(PlayerRushingStat.count).to eq(2)

      first_stat = PlayerRushingStat.first
      expect(first_stat.total_rushing_yards).to eq(7)
      expect(first_stat.longest_rush).to eq(7)
      expect(first_stat.longest_rush_with_touchdown).to eq(false)

      second_stat = PlayerRushingStat.last

      expect(second_stat.player_name).to eq('Mark Ingram')
      expect(second_stat.player_team).to eq('NO')
      expect(second_stat.player_position).to eq('RB')
      expect(second_stat.rushing_attempts).to eq(205)
      expect(second_stat.rushing_attempts_per_game_avg).to eq(12.8)
      expect(second_stat.total_rushing_yards).to eq(1043)
      expect(second_stat.rushing_average_yards_per_attempt).to eq(5.1)
      expect(second_stat.rushing_yards_per_game).to eq(65.2)
      expect(second_stat.total_rushing_touchdowns).to eq(6)
      expect(second_stat.longest_rush).to eq(75)
      expect(second_stat.longest_rush_with_touchdown).to eq(true)
      expect(second_stat.rushing_first_downs).to eq(49)
      expect(second_stat.rushing_first_down_percentage).to eq(23.9)
      expect(second_stat.rushing_twenty_plus_yards).to eq(4)
      expect(second_stat.rushing_forty_plus_yards).to eq(2)
      expect(second_stat.rushing_fumbles).to eq(2)
    end
  end

  describe '.to_csv' do
    it 'should return the player rushing stat records as csv records' do
      create(:player_rushing_stat)

      csv = PlayerRushingStat.to_csv(PlayerRushingStat.all)

      csv_lines = csv.split("\n")
      expect(csv_lines.size).to eq(2)
      expect(csv_lines.first).to eq('player_name,player_team,player_position,rushing_attempts_per_game_avg,rushing_attempts,total_rushing_yards,rushing_average_yards_per_attempt,rushing_yards_per_game,total_rushing_touchdowns,longest_rush,longest_rush_with_touchdown,rushing_first_downs,rushing_first_down_percentage,rushing_twenty_plus_yards,rushing_forty_plus_yards,rushing_fumbles')
      expect(csv_lines.last).to eq('Mark Ingram,NO,RB,12.8,205,1043,5.1,65.2,6,75,true,49,23.9,4,2,2')
    end
  end
end