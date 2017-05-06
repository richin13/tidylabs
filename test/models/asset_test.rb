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

  test "asset type to human should return correct translation" do
    plated_asset = PlatedAsset.new
    unplat_asset = UnplatedAsset.new

    assert_equal 'placa', plated_asset.type_to_h
    assert_equal 'sin placa', unplat_asset.type_to_h
  end
end
