class MainController < ApplicationController
  def new
  end

  def create
    redirect_to resources_root_path url: params['api-root-url']
  end
end
