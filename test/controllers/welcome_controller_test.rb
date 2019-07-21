# frozen_string_literal: true

require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get admin_root_path
    assert_response :success
  end
end
