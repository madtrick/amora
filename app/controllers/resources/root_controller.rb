class Resources::RootController < ApplicationController
  def index
    @resource = Resources::Root::Index.new.run(params)
  end
end
