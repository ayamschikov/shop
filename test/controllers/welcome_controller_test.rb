# frozen_string_literal: true

require 'test_helper'

class Web::Admin::WelcomeControllerTest < ActionController::TestCase
  # Use the following instead if you are on Devise <= 4.2.0
  # include Devise::TestHelpers
  include Devise::Test::ControllerHelpers

  def setup
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in FactoryBot.create(:user)
  end

  test 'should get index' do
    get :index
    assert_response :success
  end
end
