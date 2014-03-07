class Resources::MemoryController < ApplicationController
  def index
    @resource = Resources::Memory::Index.new.run(params).decorate
  end
end

