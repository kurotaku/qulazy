require 'test_helper'

class NotFoundsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get not_founds_index_url
    assert_response :success
  end

end
