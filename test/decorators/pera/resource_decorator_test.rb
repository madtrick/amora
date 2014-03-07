require "test_helper"

describe PERA::ResourceDecorator do
  let(:api) { mock( root: 'root_url' ) }
  let(:hal_resource) { mock(links: [], properties: {}) }
  let(:resource) { PERA::Resource.new api, hal_resource }

  describe "#api_root_url" do
    it "returns the root url for the API serving the resource" do
      decorated_resource = resource.decorate

      decorated_resource.api_root_url.must_equal 'root_url'
    end
  end
end
