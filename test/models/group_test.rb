require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should have value for group_owner" do
  @group.= @group.group_owner = ""
  assert_not @group.valid?
  end
end
