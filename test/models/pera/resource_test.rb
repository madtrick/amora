require "test_helper"

describe PERA::Resource do
  let(:api) { :api }
  it "generates an reader for each property" do
    hal_resource = stub(links: [], properties: {p1: 1, p2: 2})
    resource = PERA::Resource.new(api, hal_resource)

    resource.p1.must_equal 1
  end

  it "generates a reader for each link" do
    hal_resource = stub(links: [stub(rel: "self")], properties: [])
    resource = PERA::Resource.new(api, hal_resource)

    resource.must_respond_to :self_link
  end
end
