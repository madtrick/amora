class PERA::HAL::Resource
  attr_reader :links, :embedded, :properties

  def initialize(links, embedded, properties)
    @links      = links
    @embedded   = embedded
    @properties = properties
  end
end
