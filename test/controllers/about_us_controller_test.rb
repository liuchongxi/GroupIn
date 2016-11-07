require 'test_helper'

class AboutUsControllerTest < ActionController::TestCase
  test "should get site_info" do
    get :site_info
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get FAQ" do
    get :FAQ
    assert_response :success
  end

end
