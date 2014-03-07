module ApplicationHelper
  def api_root_url_link
    link_to t('root'), resources_root_url(url: @resource.api_root_url)
  end
end
