class PERA::HAL::Builders::Link
  def build(options)
    PERA::HAL::Link.new(options[:rel], options[:href])
  end
end
