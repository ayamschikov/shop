require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # frozen_string_literal: true
  setup do
    @user = create(:user)
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
    user = build(:user)

    assert_difference('User.count') do
      post admin_users_url, params: { user: {
        name: user.name,
        surname: user.surname,
        email: user.email,
        role: user.role
      } }
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
    patch admin_user_url(@user), params: { user: { name: 'new name' } }
    assert_redirected_to admin_users_url(@user)
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete admin_user_url(@user)
  end

    assert_redirected_to admin_users_url
  end
end
