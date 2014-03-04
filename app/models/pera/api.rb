class PERA::API
  attr_reader :root

  def self.extract_root_from_url(url)
    url = "http://#{url}" if URI.parse(url).scheme.nil?
    url = URI.parse(url)

    URI::HTTP.build({scheme: url.scheme, host: url.host, port: url.port}).to_s
  end

  def initialize(root_url)
    @root = root_url
  end
end
