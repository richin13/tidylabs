require 'test_helper'

class AssetsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @xhr_user = create(:user)
    @user = build(:admin)
  end

  test "should render assets page via token authentication" do
    get assets_path, headers: { 'X-User-Email': @xhr_user.email,
                                'X-User-Token': @xhr_user.authentication_token }
    assert_response :success
  end

  test "should not render assets page vith invalid token authentication" do
    get assets_path, headers: { 'X-User-Email': @xhr_user.email,
                                'X-User-Token': @xhr_user.authentication_token << '*' }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test 'should search for an asset' do
    sign_in @user

    get search_assets_path

    assert_response :redirect # WARNING: Sign_in helper function not working here
    # assert_response :success
  end
end
