class PERA::Clients::HyperResource::Resource
  def translate(hyperresource)
    PERA::HAL::Builders::Resource.new.build(
      translate_links(hyperresource),
      translate_embedded(hyperresource),
      translate_attributes(hyperresource)
    )
  end

  private
  def translate_links(hyperresource)
    hyperresource.links.map do |key, value|
      href = value.is_a?(Array) ? value.first.href : value.href
      {rel: key, href: href}
    end
  end

  def translate_attributes(hyperresource)
    hyperresource.attributes
  end

  def translate_embedded(hyperresource)
    Hash[hyperresource.objects.map {|rel, e_resources| [rel, e_resources.map {|e_resource| translate e_resource}]}]
  end
end
