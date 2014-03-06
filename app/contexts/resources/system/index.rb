class Resources::System::Index < Context
  def run(params)
    api          = PERA::API.new PERA::API.extract_root_from_url(params[:url])
    client       = PERA::Clients::HyperResource::Client.new
    hal_resource = client.fetch params[:url]
    resource     = ::System.new api, hal_resource
  end
end
