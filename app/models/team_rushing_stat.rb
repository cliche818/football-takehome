class TeamRushingStat < ApplicationRecord
  def self.create_records
    records = PlayerRushingStat.select(:player_team, "sum(rushing_attempts) as ra").group(:player_team)

    records.each do |record|
      TeamRushingStat.create(
                         player_team: record.player_team,
                         rushing_attempts: record.ra
      )
    end
  end
end