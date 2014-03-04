class PERA::Clients::HyperResource::Client
  HEADERS = {'Accept' => 'application/hal+json'}
  def fetch(endpoint)
    translate HyperResource.new(root: endpoint, headers: HEADERS).get
  end

  private
  def translate(hyperresource)
    PERA::Clients::HyperResource::Resource.new.translate(hyperresource)
  end
end
