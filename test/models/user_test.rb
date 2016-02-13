require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should save a new user when username and password present" do
    user = User.new(username: 'test_user', password: '123abc!!')
    assert user.save, "Didn't save valid user"
  end

  test "should not save a user with password under 8 chars" do
    user = User.new(username: 'test_user', password: '123')
    assert_not user.save, "Saved user with password < 8 chars"
  end

  test "should not save a user without a username" do
    user = User.new(password: '123abc!!')
    assert_not user.save, "Saved user without a username"
  end

  test "should not save a user without a password" do
    user = User.new(username: 'test_user')
    assert_not user.save, "Save user without password"
  end
end
