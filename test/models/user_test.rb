require 'test_helper'

class UserTest < ActiveSupport::TestCase
    include FactoryBot::Syntax::Methods
    test "invalid without name" do
        user = build(:user, name: nil)
        refute user.valid?, 'user is valid without a name'
    end

    test "invalid without surname" do
        user = build(:user, surname: nil)
        refute user.valid?, 'user is valid without a surname'
    end

    test "invalid without email" do
        user = build(:user, email: nil)
        refute user.valid?, 'user is valid without a email'
    end

    test "invalid with incorrect email" do
        user = build(:user, email: "incorrect_email")
        refute user.valid?, "user is valid with incorrect email"
    end

    test "only admin and user role are allowed" do
        assert_equal(["client", "admin"].sort, User.role.values.sort, "incorrect user roles")
    end
end
