class PERA::HAL::Link
  attr_reader :rel, :href

  def initialize(rel, href, options = {})
    @rel     = rel
    @href    = href
  end
end
