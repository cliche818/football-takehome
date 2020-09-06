FactoryBot.define do
  factory :player_rushing_stat do
    player_name { 'Mark Ingram' }
    player_team { 'NO' }
    player_position { 'RB' }
    rushing_attempts { 205 }
    rushing_attempts_per_game_avg { 12.8 }
    total_rushing_yards { 1043 }
    rushing_average_yards_per_attempt { 5.1 }
    rushing_yards_per_game { 65.2 }
    total_rushing_touchdowns { 6 }
    longest_rush { 75 }
    longest_rush_with_touchdown { true }
    rushing_first_downs { 49 }
    rushing_first_down_percentage { 23.9 }
    rushing_twenty_plus_yards { 4 }
    rushing_forty_plus_yards { 2 }
    rushing_fumbles { 2 }
  end
end
