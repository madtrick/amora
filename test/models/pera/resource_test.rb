require "test_helper"

describe PERA::Resource do
  let(:api) { :api }
  it "generates an reader for each property" do
    hal_resource = stub(links: [], properties: {p1: 1, p2: 2})
    resource = PERA::Resource.new(api, hal_resource)

    resource.p1.must_equal 1
  end

  it "generates a reader for each link" do
    hal_resource = stub(links: [stub(rel: "self")], properties: {})
    resource = PERA::Resource.new(api, hal_resource)

    resource.must_respond_to :self_link
  end

  describe "#fetched_properties" do
    it "returns the properties fetched for this resource" do
      hal_resource = stub(links: [], properties: {p1: 1, p2: 2})
      resource = PERA::Resource.new(api, hal_resource)

      resource.fetched_properties.must_equal({p1: 1, p2: 2})
    end
  end

  describe "#fetched_embededd" do
    it "returns the embedded fetched for this resource"  do
      embedded_resource = stub(links: [], properties: {})
      embedded_resources= {resources: [embedded_resource]}
      hal_resource      = stub(links: [], embedded: embedded_resources, properties: {})
      resource = PERA::Resource.new(api, hal_resource)
      PERA::Resource.stubs(:new).returns(embedded_resource)

      resource.fetched_embededd.must_equal(embedded_resources)
    end


  end
end
