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
        {},
        { "p1" => 1, "p2" => 2 }
      )

      PERA::Clients::HyperResource::Resource.new.translate hyperresource
    end
  end

  describe "when there are embedded resources" do
    before(:each) do
      stub_request(:get, 'http://localhost:8000/processes').to_return(
        status: 200,
        body: {
          "_links" => {"self" => {"href" => "/processes"}},
          "_embedded" =>
            {"processes" => [
              {
                "_links" => {"self" => {"href" => "/processes/1"}},
                "_embedded" => {},
                "pid" => "<0.1.0>"
              },
              {
                "_links" => {"self" => {"href" => "/processes/2"}},
                "_embedded" => {},
                "pid" => "<0.2.0>"
              }
            ]
            },
          "p1" => 1, "p2" => 2}.to_json,
        headers: {"Content-Type" => "application/hal+json"}
      )
    end

    let(:client) { HyperResource.new(root: "http://localhost:8000/processes", headers: {'Accept' => 'application/hal+json'}) }

    describe "#translate" do
      it "creates embedded resources" do
        hyperresource     = client.get()
        embedded_resource_1 = mock()
        embedded_resource_2 = mock()

        root_builder = mock()
        root_builder
          .expects(:build)
          .with([{rel: "self", href: "/processes"}], {"processes" => [embedded_resource_1, embedded_resource_2]}, {"p1" => 1, "p2" => 2})

        embedded_builder_1 = mock()
        embedded_builder_1
          .expects(:build)
          .with([{rel: "self", href: "/processes/1"}], {}, {"pid" => "<0.1.0>"})
          .returns(embedded_resource_1)

        embedded_builder_2 = mock()
        embedded_builder_2
          .expects(:build)
          .with([{rel: "self", href: "/processes/2"}], {}, {"pid" => "<0.2.0>"})
          .returns(embedded_resource_2)

        PERA::HAL::Builders::Resource
          .stubs(:new)
          .returns(root_builder)
          .then.returns(embedded_builder_1)
          .then.returns(embedded_builder_2)


        PERA::Clients::HyperResource::Resource.new.translate hyperresource
      end
    end

  end
end
