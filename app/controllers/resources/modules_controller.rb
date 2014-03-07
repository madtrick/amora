class Resources::ModulesController < ApplicationController
  def index
    @resource = Resources::Modules::Index.new.run(params).decorate
  end
end

