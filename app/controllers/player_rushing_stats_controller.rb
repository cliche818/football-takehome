class PlayerRushingStatsController < ApplicationController
  def index
    @player_rushing_stats = PlayerRushingStat.all
  end
end
