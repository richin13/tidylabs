require 'test_helper'

class AssetRevisionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @revision = build(:asset_revision)
    @user = create(:collaborator)
    @auth_headers = { 'X-User-Email': @user.email,
                      'X-User-Token': @user.authentication_token }
  end

  test "should create asset_revision" do
    post asset_revisions_path, headers: @auth_headers,
                  params: { asset_revision: { asset: @revision.asset.id, 
                                              revision: @revision.revision.id }, 
                                              format: :json }

    assert_response :created
  end

  test "should destroy asset_revision" do
    @revision.save

    assert_difference 'AssetRevision.count', -1 do
      delete asset_revision_path(@revision), headers: @auth_headers, params: { format: :json }
    end
    assert_response :no_content
  end
end
