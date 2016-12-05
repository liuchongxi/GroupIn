require 'test_helper'

class AdRequestsControllerTest < ActionController::TestCase
  setup do
    @ad = ad_requests(:one)
    #@controller = AdRequestsController.new
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should destroy ad_request" do
    assert_difference('AdRequest.count', -1) do
      delete :destroy, id: @ad
    end

    assert_redirected_to ad_requests_path
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ad request" do
    assert_difference('AdRequest.count') do
      post :create, ad_request: {first_name: "example", last_name: "example", phone_num: "12345", email: "message@abc.ca", request_detail: "mytext", ad_name: "abcdef"}
    end

    #assert_redirected_to ad_request_path(assigns(:ad_request))
  end

  test "should show ad" do
    get :show, id: @ad
    assert_response :success
  end
end
