class PERA::Link
  delegate :rel, to: :pera_hal_link

  def initialize(api, pera_hal_link)
    @api           = api
    @pera_hal_link = pera_hal_link
  end

  def url
    URI.join(@api.root, @pera_hal_link.href).to_s
  end

  private
  def pera_hal_link
    @pera_hal_link
  end
end
