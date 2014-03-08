require "test_helper"
require "webmock/minitest"

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassetes'
  c.hook_into :webmock
end

describe PERA::Clients::HyperResource::Client do
  let(:client) {PERA::Clients::HyperResource::Client.new}

  describe "#fetch" do
    it "uses the underlying client to get the resource identified by the given URL" do
      VCR.use_cassette 'hyperresource_client_memory_resource' do
        hyperresource = HyperResource.new(root: "http://localhost:8000/memory", headers: {'Accept' => 'application/hal+json'})
        hyperresource.expects(:get).with().returns(hyperresource)
        HyperResource.stubs(:new).returns(hyperresource)

        client.fetch("http://localhost:8000/memory")
      end
    end
    it "returns a resource object" do
      VCR.use_cassette 'hyperresource_client_memory_resource' do
        resource = client.fetch("http://localhost:8000/memory")
        resource.must_be_instance_of PERA::HAL::Resource
      end
    end
  end

  describe "when the connection to the API can't be established" do
    it "raises a PERA::Client::ConnectionFailedError exception" do
      VCR.use_cassette 'hyperresource_connection_refused' do
        -> {client.fetch('http://localhost:8001')}.must_raise PERA::Clients::ConnectionFailedError
      end
    end
  end
end
