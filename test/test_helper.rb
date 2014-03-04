ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# Require test_helper/*.rb with further configuration
Dir.glob(File.expand_path('../test_helpers/*.rb', __FILE__)).each { |f| require f }
