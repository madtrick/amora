require 'pera/clients/errors'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from PERA::Clients::ConnectionFailedError, with: :connection_failed

  protected
  def connection_failed(error)
    render 'errors/connection_failed'
  end
end
