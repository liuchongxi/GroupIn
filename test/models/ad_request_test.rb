require 'test_helper'

class AdRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
   @ad=  AdRequest.new(first_name: "example", last_name: "example", phone_num: "12345", email: "message@abc.ca", request_detail: "mytext", ad_name: "abc")
  end

  test "should have value for first_name" do
  @ad.first_name = " "
  assert_not @ad.valid?
  end

  test "first_name should have a maximum length" do
  @ad.first_name = "a" * 26
  assert_not @ad.valid?
  end

  test "should have value for last_name" do
  @ad.last_name = " "
  assert_not @ad.valid?
  end

  test "last_name should have a maximum length" do
  @ad.last_name = "a" * 51
  assert_not @ad.valid?
  end

  test "eamil should have correct format" do
  @ad.email = "a@sss"
  assert_not @ad.valid?
  end

end
