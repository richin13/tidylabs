require 'test_helper'

class DefaultsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @user = build(:user)
  end

  test "should get index" do
    sign_in @user

    get root_url
    assert_response :success
  end
end
