# frozen_string_literal: true

require 'test_helper'

class Web::Admin::UsersControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in FactoryBot.create(:user)
  end

  setup do
    @user = create(:user)
    @attributes = attributes_for :user
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create user' do
    @user = build(:user)

    assert_difference('User.count') do
      post :create, params: { user: @attributes }
    end

    assert_redirected_to [:admin, User.last]
  end

  test 'should show user' do
    get :show, params: { id: @user }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @user }
    assert_response :success
  end

  test 'should update user' do
    updated_name = generate(:string)

    patch :update, params: { id: @user, user: { name: updated_name } }
    assert_redirected_to admin_users_url(@user)

    @user.reload
    assert_equal updated_name, @user.name
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete :destroy, params: { id: @user }
    end

    assert_redirected_to %i[admin users]
  end
end
