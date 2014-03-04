class PERA::HAL::Builders::Resource
  def build(links, embedded, properties)
    resource = PERA::HAL::Resource.new(build_links(links), embedded, properties)
  end

  private
  def build_links(links)
    links.map {|link| PERA::HAL::Builders::Link.new.build(link)}
  end

end
