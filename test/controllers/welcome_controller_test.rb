# frozen_string_literal: true

require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get user_session_path
    assert_response :success
  end
end
