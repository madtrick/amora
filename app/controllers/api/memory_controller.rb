class Api::MemoryController < ApplicationController
  respond_to :json

  def index
    respond_with Resources::Memory::Index.new.run(params), serializer: Resources::MemorySerializer
  end
end


