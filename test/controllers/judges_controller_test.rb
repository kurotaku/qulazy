require 'test_helper'

class JudgesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get judges_create_url
    assert_response :success
  end

  test "should get destroy" do
    get judges_destroy_url
    assert_response :success
  end

end
