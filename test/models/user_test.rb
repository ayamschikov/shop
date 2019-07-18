# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  test 'invalid without name' do
    user = build(:user, name: nil)
    assert_not user.valid?, 'user is valid without a name'
  end

  test 'invalid without surname' do
    user = build(:user, surname: nil)
    assert_not user.valid?, 'user is valid without a surname'
  end

  test 'invalid without email' do
    user = build(:user, email: nil)
    assert_not user.valid?, 'user is valid without an email'
  end

  test 'invalid with incorrect email' do
    user = build(:user, email: 'incorrect_email')
    assert_not user.valid?, 'user is valid with incorrect email'
  end

  test 'email should be unique' do
    first_user = build(:user, email: 'test@gmail.com')
    first_user.save

    second_user = build(:user, email: 'test@gmail.com')
    assert_not second_user.save, 'user is valid with not unique email'
  end

  test 'user should not accept incorrect role' do
    user = build(:user, role: :some_test_role)
    assert_not user.valid?
  end
end
