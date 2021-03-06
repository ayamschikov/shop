# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

Money.locale_backend = :i18n

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # Add more helper methods to be used by all tests here...
  include FactoryBot::Syntax::Methods
  include Devise::Test::IntegrationHelpers
end
