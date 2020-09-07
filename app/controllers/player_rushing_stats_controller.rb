class PlayerRushingStatsController < ApplicationController
  def index
    @player_rushing_stats = PlayerRushingStat

    if params[:player_name].present?
      @player_rushing_stats = @player_rushing_stats.where('player_name like ?', "%#{params[:player_name]}%")
    else
      @player_rushing_stats = @player_rushing_stats.all
    end

    if sort_column.present? && sort_order.present?
      @player_rushing_stats = @player_rushing_stats.order("#{sort_column} #{sort_order}")
    end
  end

  private

  def sort_order
    %w[asc desc].include?(params[:sort_order]) ? params[:sort_order] : nil
  end

  def sort_column
    PlayerRushingStat.column_names.include?(params[:sort_column]) ? params[:sort_column] : nil
  end
end
