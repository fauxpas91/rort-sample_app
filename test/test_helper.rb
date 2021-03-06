ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require "minitest/reporters"

Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
    @user_model = User.new(name:"Example User", email: "user@example.com",
                  password: "foobar", password_confirmation: "foobar")
  end

  # Add more helper methods to be used by all tests here...
end
