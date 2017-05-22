require 'test_helper'

class AreasControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = build(:user)
    @area = create(:area)
  end

  test "should render index page" do
    sign_in @user
    get areas_path

    assert_response :success
  end

  test "should render new page" do
    sign_in @user
    get new_area_path

    assert_response :success
  end

  test "should render show page" do
    sign_in @user
    get area_path @area

    assert_response :success
  end

  test "should render edit page" do
    sign_in @user
    get edit_area_path @area

    assert_response :success
  end
end
