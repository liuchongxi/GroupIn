require 'test_helper'

class CategoryControllerTest < ActionController::TestCase
  test "should get sports" do
    get :sports
    assert_response :success
  end

  test "should get food" do
    get :food
    assert_response :success
  end

  test "should get study" do
    get :study
    assert_response :success
  end

end
