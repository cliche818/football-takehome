class TeamRushingStatsController < ApplicationController
  def index
    @team_rushing_stats = TeamRushingStat.all
  end
end