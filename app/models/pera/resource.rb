class PERA::Resource
  include PERA::Serialization
  include PERA::Decoration

  attr_reader :api

  def initialize(api, pera_hal_resource)
    @api          = api
    @hal_resource = pera_hal_resource
    generate_readers_for_properties
    generate_readers_for_links
  end

  def fetched_properties
    @hal_resource.properties
  end

  def fetched_embededd
    Hash[@hal_resource.embedded.map {|rel, embedded| [rel, embedded.map {|embedded| self.class.new(@api, embedded)}]}]
  end


  private
  def generate_readers_for_links
    links = @hal_resource.links
    self.class.class_eval do
      links.each do |link|
        define_method("#{link.rel}_link") do
          PERA::Link.new @api, @hal_resource.links.detect {|l| l.rel == link.rel}
        end
      end
    end
  end

  def generate_readers_for_properties
    names = @hal_resource.properties.keys
    self.class.class_eval do
      names.each do |key|
        define_method(key) { @hal_resource.properties[key] }
      end
    end
  end
end
