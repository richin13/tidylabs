require 'test_helper'

class AssetTest < ActiveSupport::TestCase
  test "platedAsset attributes must not be empty" do
    asset = PlatedAsset.new
    assert asset.invalid?
  end

  test "unplatedAsset attributes must not be empty" do
    asset = UnplatedAsset.new
    assert asset.invalid?
  end
end
