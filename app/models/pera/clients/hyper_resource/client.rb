require "pera/clients/errors"

class PERA::Clients::HyperResource::Client
  HEADERS = {'Accept' => 'application/hal+json'}
  def fetch(endpoint)
    begin
      translate HyperResource.new(root: endpoint, headers: HEADERS).get
    rescue Faraday::ConnectionFailed
      raise PERA::Clients::ConnectionFailedError.new host: endpoint
    end
  end

  private
  def translate(hyperresource)
    PERA::Clients::HyperResource::Resource.new.translate(hyperresource)
  end
end
