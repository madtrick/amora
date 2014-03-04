require "test_helper"

describe PERA::HAL::Builders::Link do
  let(:builder){ PERA::HAL::Builders::Link.new }
  describe "#build" do
    it "creates a link object" do
      link = builder.build({rel: "self", href: "/example"})

      link.rel.must_equal "self"
      link.href.must_equal "/example"
    end
  end
end
