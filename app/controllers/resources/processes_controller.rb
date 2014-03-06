class Resources::ProcessesController < ApplicationController
  def index
    @resource = Resources::Processes::Index.new.run(params)
  end
end

