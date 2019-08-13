# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
    @attributes = attributes_for :user
  end

  test 'should get index' do
    get admin_users_url
    assert_response :success
  end

  test 'should get new' do
    get new_admin_user_url
    assert_response :success
  end

  test 'should create user' do
    @user = build(:user)

    assert_difference('User.count') do
      post admin_users_url, params: { user: @attributes }
    end

    assert_redirected_to admin_user_url(User.last)
  end

  test 'should show user' do
    get admin_user_url(@user)
    assert_response :success
  end

  test 'should get edit' do
    get edit_admin_user_url(@user)
    assert_response :success
  end

  test 'should update user' do
    updated_name = generate(:string)

    patch admin_user_url(@user), params: { user: { name: updated_name } }
    assert_redirected_to admin_users_url(@user)

    @user.reload
    assert_equal updated_name, @user.name
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete admin_user_url(@user)
    end

    assert_redirected_to admin_users_url
  end
end
