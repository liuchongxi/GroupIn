require 'test_helper'

class AdRequestControllerTest < ActionController::TestCase
  setup do
    @ad = ad_requests(:one)
  end
  test "should get index" do
    get :index
    assert_response :success
  end
  test "should get delete" do
    get :delete
    assert_response :success
  end
  test "should get new" do
    get :new
    assert_response :success
  end
  test "should show ad" do
    get :show, id: @ad
    assert_response :success
  end
end
