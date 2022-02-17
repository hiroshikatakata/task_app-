require "test_helper"

class SignsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get signs_show_url
    assert_response :success
  end
end
