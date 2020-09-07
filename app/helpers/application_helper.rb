module ApplicationHelper
  def sortable(column, title)
    sort_order = params[:sort_order] == 'asc' ? 'desc' : 'asc'

    link_to title, { sort_column: column, sort_order: sort_order }, { class: "sorted #{sort_order}" }
  end
end
