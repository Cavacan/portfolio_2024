require "test_helper"

class ExnessControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get exness_index_url
    assert_response :success
  end
end
