module ApplicationHelper
  def sortable(column, title)
    sort_order = params[:sort_order] == 'asc' ? 'desc' : 'asc'
    css_class = column == params[:sort_column] ? "sorted #{sort_order}" : ''

    link_to title, { sort_column: column, sort_order: sort_order }, { class: css_class }
  end
end
