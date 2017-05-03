require 'test_helper'

class AssetCategoryTest < ActiveSupport::TestCase
  test "assetCategory attributes must not be empty" do
    category = AssetCategory.new
    assert category.invalid?
  end
end
