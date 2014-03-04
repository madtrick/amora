class Resources::MemoryController < ApplicationController
  def index
    @resource = Resources::Memory::Index.new.run(params)
  end
end

