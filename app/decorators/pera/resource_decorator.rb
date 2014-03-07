class PERA::ResourceDecorator < Draper::Decorator
  delegate_all

  def api_root_url
    object.api.root
  end
end
