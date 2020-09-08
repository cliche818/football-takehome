module ApplicationHelper
  def sortable(column, title)
    css_class = column == params[:sort_column] ? "sorted #{params[:sort_order]}" : ''
    sort_order = params[:sort_order] == 'asc' ? 'desc' : 'asc'

    search_params = { sort_column: column, sort_order: sort_order }

    if params[:player_name].present?
      search_params.merge!(player_name: params[:player_name])
    end

    link_to title, search_params, { class: css_class }
  end
end
