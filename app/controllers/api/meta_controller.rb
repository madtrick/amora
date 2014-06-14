class Api::MetaController < ApplicationController
  respond_to :json

  def index
    respond_with build_response_hash(Resources::Root::Index.new.run(params))
  end

  private
  def build_response_hash(resource)
    {memory: resource.memory_link.url, system: resource.system_link.url}
  end
end
