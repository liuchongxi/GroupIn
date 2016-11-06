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

  test "should have value for password_digest" do
  @user.password = @user.password_confirmation = "a" * 10
  assert @user.password_digest!=nil?
  end
  
end
