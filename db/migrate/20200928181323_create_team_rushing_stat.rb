class CreateTeamRushingStat < ActiveRecord::Migration[6.0]
  def change
    create_table :team_rushing_stats do |t|
      t.string :player_team
      t.integer :rushing_attempts

      t.timestamps
    end
  end
end
