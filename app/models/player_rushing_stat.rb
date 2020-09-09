require 'csv'

class PlayerRushingStat < ApplicationRecord
  def self.import_json(file_path)
    raw_json = File.read(file_path)

    rushings = JSON.parse(raw_json)

    rushings.each do |rushing|
      longest_rush = rushing['Lng'].to_i
      longest_rush_with_touchdown = rushing['Lng'].class == String ? rushing['Lng'].index('T').present? : false

      total_rushing_yards = rushing['Yds'].class == String ? rushing['Yds'].gsub(',', '') : rushing['Yds']

      PlayerRushingStat.create(
          player_name: rushing['Player'],
          player_team: rushing['Team'],
          player_position: rushing['Pos'],
          rushing_attempts_per_game_avg: rushing['Att/G'],
          rushing_attempts: rushing['Att'],
          total_rushing_yards: total_rushing_yards,
          rushing_average_yards_per_attempt: rushing['Avg'],
          rushing_yards_per_game: rushing['Yds/G'],
          total_rushing_touchdowns: rushing['TD'],
          longest_rush: longest_rush,
          longest_rush_with_touchdown: longest_rush_with_touchdown,
          rushing_first_downs: rushing['1st'],
          rushing_first_down_percentage: rushing['1st%'],
          rushing_twenty_plus_yards: rushing['20+'],
          rushing_forty_plus_yards: rushing['40+'],
          rushing_fumbles: rushing['FUM']
      )
    end
  end

  def self.to_csv(player_rushing_stats)
    csv_columns = [
      'Player',
      'Team',
      'Pos',
      'Att',
      'Att/G',
      'Yds',
      'Avg',
      'Yds/G',
      'TD',
      'Lng',
      '1st',
      '1st%',
      '20+',
      '40+',
      'FUM'
    ]

    CSV.generate do |csv|
      csv << csv_columns
      player_rushing_stats.each do |player_rushing_stat|
        csv <<  [ player_rushing_stat.player_name,
                  player_rushing_stat.player_team,
                  player_rushing_stat.player_position,
                  player_rushing_stat.rushing_attempts,
                  player_rushing_stat.rushing_attempts_per_game_avg,
                  player_rushing_stat.total_rushing_yards,
                  player_rushing_stat.rushing_average_yards_per_attempt,
                  player_rushing_stat.rushing_yards_per_game,
                  player_rushing_stat.total_rushing_touchdowns,
                  "#{player_rushing_stat.longest_rush}#{player_rushing_stat.longest_rush_with_touchdown ? 'T' : ''}",
                  player_rushing_stat.rushing_first_downs,
                  player_rushing_stat.rushing_first_down_percentage,
                  player_rushing_stat.rushing_twenty_plus_yards,
                  player_rushing_stat.rushing_forty_plus_yards,
                  player_rushing_stat.rushing_fumbles
        ]
      end
    end
  end
end