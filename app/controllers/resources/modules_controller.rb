class Resources::ModulesController < ApplicationController
  def index
    @resource = Resources::Modules::Index.new.run(params)
  end
end

