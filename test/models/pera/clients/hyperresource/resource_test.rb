require "test_helper"
require "webmock/minitest"

describe PERA::Clients::HyperResource::Resource do
  before(:each) do
    stub_request(:get, 'http://localhost:8000/memory').to_return(
      status: 200,
      body: {"_links" => {"self" => {"href" => "/memory"}}, "_embedded" => {}, "p1" => 1, "p2" => 2}.to_json,
      headers: {"Content-Type" => "application/hal+json"}
    )
  end

  let(:client) { HyperResource.new(root: "http://localhost:8000/memory", headers: {'Accept' => 'application/hal+json'}) }

  describe "#translate" do
    it "translates an hyperresource into a PERA resource" do
      hyperresource = client.get()
      PERA::HAL::Builders::Resource.any_instance.expects(:build).with(
        [{rel: "self", href: "/memory"}],
        [],
        { "p1" => 1, "p2" => 2 }
      )

      PERA::Clients::HyperResource::Resource.new.translate hyperresource
    end
  end
end
