module PERA::Clients
  # Raised when the connection to the endpoint can't be
  # made
  #
  # This is the exception that all client wrappers should
  # raise on connection refused/timeout errors
  class ConnectionFailedError < StandardError; end
end
