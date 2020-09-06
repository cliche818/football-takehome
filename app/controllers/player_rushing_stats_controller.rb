class PlayerRushingStatsController < ApplicationController
  def index
    if params[:player_name].present?
      @player_rushing_stats = PlayerRushingStat.where('player_name like ?', "%#{params[:player_name]}%")
    else
      @player_rushing_stats = PlayerRushingStat.all
    end
  end
end
