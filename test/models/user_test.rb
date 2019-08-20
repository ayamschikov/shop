# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'invalid without name' do
    user = build(:user, name: nil)
    assert user.invalid?
  end

  test 'invalid without surname' do
    user = build(:user, surname: nil)
    assert user.invalid?
  end

  test 'invalid with incorrect email' do
    user = build(:user, email: 'incorrect_email')
    assert user.invalid?
  end

  test 'email should be unique' do
    first_user = build(:user, email: 'test@gmail.com')
    first_user.save

    second_user = build(:user, email: 'test@gmail.com')
    assert_not second_user.save
  end

  test 'user should not accept incorrect role' do
    user = build(:user, role: :some_test_role)
    assert user.invalid?
  end
end
