class PERA::HAL::Resource
  attr_reader :links, :properties

  def initialize(links, embedded, properties)
    @links      = links
    @properties = properties
  end
end
