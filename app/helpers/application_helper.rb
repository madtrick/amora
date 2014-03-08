module ApplicationHelper
  def menu_link(text, link)
    link_to link do
      "<i class='fa fa-angle-right'></i> #{text}".html_safe
    end
  end
end
