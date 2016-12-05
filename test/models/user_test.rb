require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #test "password should equal to confirmation" do
    #@user.password = @user.password_confirmation = " " * 6
    #assert_not @user.valid?
  #end
  def setup
   @user = User.new(first_name: "Example", last_name: "user", email: "user@sfu.ca",
                    password: "12345a", password_confirmation: "12345a")
  end

  test "first name should be present" do
  @user.first_name = " " * 7
  assert_not @user.valid?
  end

  test "first name should have a maximum length" do
  @user.first_name = "a" * 51
  assert_not @user.valid?
  end

  test "last name should be present" do
  @user.last_name = " " * 7
  assert_not @user.valid?
  end

  test "last name should have a maximum length" do
  @user.last_name = "a" * 51
  assert_not @user.valid?
  end

  test "email should be present" do
  @user.email = " " * 7
  assert_not @user.valid?
  end

  test "email should be unique" do
  user1 = User.create(first_name: "Example", last_name: "user", email: "user@sfu.ca",password: "12345a", password_confirmation: "12345a")
  user2 = User.new(first_name: "Example2", last_name: "user2", email: "USER@SFU.CA",password: "12345b", password_confirmation: "12345b")
  assert_not user2.valid?
  end

  test "email should not not have @something that is not sfu" do
  @user.email = "blah@blah.com"
  assert_not @user.valid?
  end

  test "password should be present" do
  @user.password = @user.password_confirmation = " " * 7
  assert_not @user.valid?
  end

  test "password should have a minimum length" do
  @user.password = @user.password_confirmation = "a" * 4
  assert_not @user.valid?
  end

  test "password should have a maximum length" do
  @user.password = @user.password_confirmation = "a" * 11
  assert_not @user.valid?
  end

  test "password and confirmation should match" do
    user1 = User.new(first_name: "Example", last_name: "user", email: "user@sfu.ca",password: "12345a", password_confirmation: "12345b")
    assert_not user1.valid?
  end

  test "should have value for password_digest" do
  @user.password = @user.password_confirmation = "a" * 10
  assert @user.password_digest!=nil?
  end

end
