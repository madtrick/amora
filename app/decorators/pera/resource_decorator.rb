class PERA::ResourceDecorator < Draper::Decorator
  delegate_all

  def name
    object.class.name
  end

  def api_root_url
    object.api.root
  end
end
