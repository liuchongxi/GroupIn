require 'test_helper'

class GroupsControllerTest < ActionController::TestCase
  setup do
    @group = groups(:one)
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

#  test "should create group" do
#    @loggedin_user = @user
#     assert_difference('Group.count') do
#       post :create, group: { activity_type: @group.activity_type, description: @group.description, group_owner: @group.group_owner, location: @group.location, member1: @group.member1,
#          member2: @group.member2, member3: @group.member3, member4: @group.member4, name: @group.name, time: @group.time, user_id: @group.user_id }
#     end
#
#     assert_redirected_to group_path(assigns(:group))
#   end

  test "should show group" do
    get :show, id: @group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group
    assert_response :success
  end

  # test "should update group" do
  #   patch :update, id: @group, group: {user_id: @group.user_id, activity_type: @group.activity_type, description: @group.description, group_owner: @group.group_owner, location: @group.location, member1: @group.member1,
  #     member2: @group.member2, member3: @group.member3, member4: @group.member4, name: @group.name, time: @group.time }
  #   assert_redirected_to group_path(assigns(:group))
  # end

  test "should destroy group" do
    assert_difference('Group.count', -1) do
      delete :destroy, id: @group
    end

    assert_redirected_to groups_path
  end
end
