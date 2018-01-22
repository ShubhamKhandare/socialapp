require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'pry'
class ActiveSupport::TestCase

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def is_logged_in?
  	!user_session[:user_id].nil?
  end

  def log_in_as(user)
    user_session[:user_id] = user.id
  end
end

class ActionDispatch::IntegrationTest

  # Log in as a particular user.
  def log_in_as(user, password: 'password')
    post login_path, params: { user_session: { email: user.email,
                                          password: password
                                          } }
  end
end
