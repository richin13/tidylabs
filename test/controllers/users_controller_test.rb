require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create(:admin)
    @headers_a = {
        'X-User-Email': @admin.email,
        'X-User-Token': @admin.authentication_token
    }

    @collaborator = create(:collaborator)
    @headers_c = {
        'X-User-Email': @collaborator.email,
        'X-User-Token': @collaborator.authentication_token
    }
  end

  test 'should access protected endpoints with valid token' do
    get assets_path, params: {
        format: :json
    }, headers: @headers_c

    assert_response :ok

    get assets_path, params: {
        format: :json
    }, headers: @headers_a

    assert_response :ok
  end
end
