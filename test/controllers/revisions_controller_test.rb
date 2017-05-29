require 'test_helper'

class RevisionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @revision = build(:revision)
  end

  test "should create revision" do
    post revisions_path, params: { revision: { name: @revision.name }, format: :json }

    assert_response :created
  end

  test "should show revision" do
    @revision.save
    get revision_path(@revision), params: { format: :json }
    body = JSON.parse(response.body)

    assert_equal @revision.id, body.fetch('id')
    assert_equal @revision.name, body.fetch('name')
  end

  test "should update revision" do
    @revision.save

    put revision_path(@revision), params: { revision: { name: 'Other name' }, format: :json }
    body = JSON.parse(response.body)

    assert_response :ok
    assert_equal 'Other name', Revision.find(@revision.id).name
  end

  test "should destroy revision" do
    @revision.save

    assert_difference 'Revision.count', -1 do
      delete revision_path(@revision), params: { format: :json }
    end
    assert_response :no_content
  end
end
