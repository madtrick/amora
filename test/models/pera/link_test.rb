require "test_helper"

describe PERA::Link do
  let(:api) { API.new "http://localhost" }
  let(:pera_hal_link) { PERA::HAL::Link.new("resource", "/resource") }

  describe "#url" do
    it "returns a url" do
      link = PERA::Link.new(api, pera_hal_link)

      link.url.must_equal "http://localhost/resource"
    end
  end
end
