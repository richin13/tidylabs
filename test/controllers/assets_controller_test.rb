require 'test_helper'

class AssetsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = create(:user)
  end

  test "should render assets page via token authentication" do
    get assets_path, headers: { 'X-User-Email': @user.email,
                                'X-User-Token': @user.authentication_token }
    assert_response :success
  end

  test "should not render assets page vith invalid token authentication" do
    get assets_path, headers: { 'X-User-Email': @user.email,
                                'X-User-Token': @user.authentication_token << '*' }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end
end
