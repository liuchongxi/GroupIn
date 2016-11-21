require 'test_helper'

class MessageBoardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
   @message_board = MessageBoard.new(sender: "example", user_id: "1", group_name: "name", message: "message")
  end

  test "should have value for sender" do
  @message_board.sender = " "
  assert_not @message_board.valid?
  end

  test "should have value for user_id" do
  @message_board.user_id = " "
  assert_not @message_board.valid?
  end

  test "should have value for group_name" do
  @message_board.group_name = " "
  assert_not @message_board.valid?
  end

  test "should have value for message" do
  @message_board.message = " "
  assert_not @message_board.valid?
  end

  test "message should have a maximum length" do
  @message_board.message = "a" * 201
  assert_not @message_board.valid?
  end
end
