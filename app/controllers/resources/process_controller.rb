class Resources::ProcessController < ApplicationController
  def index
    @resource = Resources::Process::Index.new.run(params).decorate
  end
end

