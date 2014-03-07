class Resources::SystemController < ApplicationController
  def index
    @resource = Resources::System::Index.new.run(params).decorate
  end
end
