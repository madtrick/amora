require "test_helper"

describe PERA::API do
  describe ".extract_root_from_url" do
    it "extracts the root part for an resource url" do
      url = "http://localhost/resource"

      root = PERA::API.extract_root_from_url url
      root.must_equal "http://localhost"
    end
  end
end
