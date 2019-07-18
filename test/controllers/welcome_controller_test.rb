require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get admin_root_url
    assert_response :success
  end
end
