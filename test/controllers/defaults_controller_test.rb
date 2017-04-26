require 'test_helper'

class DefaultsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get defaults_index_url
    assert_response :success
  end

end
