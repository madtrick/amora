class PERA::Resource
  def initialize(api, pera_hal_resource)
    @api          = api
    @hal_resource = pera_hal_resource
    generate_readers_for_properties @hal_resource.properties
    generate_readers_for_links @hal_resource.links
  end

  def fetched_properties
    @hal_resource.properties
  end

  private
  def generate_readers_for_links(links)
    self.class.class_eval do
      links.each do |link|
        define_method("#{link.rel}_link") { PERA::Link.new @api, link }
      end
    end
  end

  def generate_readers_for_properties(properties)
    self.class.class_eval do
      properties.each do |key, value|
        define_method(key) { value }
      end
    end
  end
end
