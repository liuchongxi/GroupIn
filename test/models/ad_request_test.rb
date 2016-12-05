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

  test "should have value for phone number" do
  @ad.phone_num = " "
  assert_not @ad.valid?
  end

  test "phone number should have a maximum length" do
  @ad.phone_num = "a" * 13
  assert_not @ad.valid?
  end

  test "email should have correct format" do
  @ad.email = "a@ssss"
  assert_not @ad.valid?
  end

  test "email should be unique" do
  ad1 = AdRequest.create(first_name: "example", last_name: "example", phone_num: "12345", email: "message@abc.ca", request_detail: "mytext", ad_name: "abc")
  ad2 = AdRequest.new(first_name: "example", last_name: "example", phone_num: "12345", email: "MESSAGE@ABC.CA", request_detail: "mytext", ad_name: "abc")
  assert_not ad2.valid?
  end

  test "should have value for request_detail" do
  @ad.request_detail = " "
  assert_not @ad.valid?
  end

  test "request_detail should have a maximum length" do
  @ad.request_detail = "a" * 501
  assert_not @ad.valid?
  end

end
