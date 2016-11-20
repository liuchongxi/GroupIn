require 'test_helper'

class MessageBoardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "password should be present" do
  @user.password = @user.password_confirmation = " " * 7
  assert_not @user.valid?
  end

end
