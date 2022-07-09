module ApplicationHelper
  def icon(str)
    "<i class=\"#{str}\"></i>".html_safe
  end
end
