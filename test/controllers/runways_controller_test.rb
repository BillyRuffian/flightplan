require "test_helper"

class RunwaysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get runways_index_url
    assert_response :success
  end
end
