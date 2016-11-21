require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
   def setup
    @group = Group.new(name: "Example", time: "2016-12-19 08:43:00", activity_type: "sports", location: "sfu",
                     group_owner: "owner", member1: "member1", member2: "member2", member3: "member3", member4: "member4",
                     description: "play soccer", user_id: "0", member1id: "1", member2id: "2", member3id: "3", member4id: "4")
   end

   test "should have value for name" do
   @group.name = " "
   assert_not @group.valid?
   end

   test "name should have a maximum length" do
   @group.name = "a" * 51
   assert_not @group.valid?
   end

   test "should have value for time" do
   @group.time = " "
   assert_not @group.valid?
   end

   test "should have value for activity_type" do
   @group.activity_type = " "
   assert_not @group.valid?
   end

   test "should have value for location" do
   @group.location = " "
   assert_not @group.valid?
   end

   test "location should have a maximum length" do
   @group.location = "a" * 51
   assert_not @group.valid?
   end

   test "should have value for group_owner" do
   @group.group_owner = " "
   assert_not @group.valid?
   end

   test "should have value for description" do
   @group.description = " "
   assert_not @group.valid?
   end

   test "description should have a maximum length" do
   @group.description = "a" * 501
   assert_not @group.valid?
   end
end
