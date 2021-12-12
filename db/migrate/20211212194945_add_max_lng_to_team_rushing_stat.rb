class AddMaxLngToTeamRushingStat < ActiveRecord::Migration[6.0]
  def change
    add_column :team_rushing_stats, :max_lng, :integer
  end
end
