class TeamRushingStat < ApplicationRecord
  def self.create_records
    records = PlayerRushingStat.select(:player_team, "sum(rushing_attempts) as ra").group(:player_team)

    max_longest_rushing_yards = PlayerRushingStat.select(:player_team, "max(longest_rush) as maxlng").group(:player_team)

    records.each do |record|
      max_lng_record = max_longest_rushing_yards.find { |lng_record| lng_record.player_team == record.player_team }

      TeamRushingStat.create(
                         player_team: record.player_team,
                         rushing_attempts: record.ra,
                         max_lng: max_lng_record.maxlng
      )
    end
  end
end