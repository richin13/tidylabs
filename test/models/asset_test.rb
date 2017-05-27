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
    plated_asset = build(:plated_asset)
    unplat_asset = build(:unplated_asset)

    assert_equal 'Con placa', plated_asset.type_to_h
    assert_equal 'Sin placa', unplat_asset.type_to_h
  end

  test "asset should generate identification code after create" do
    asset = create(:plated_asset)
    assert_not_nil asset.identification_code.code 
  end

  test "asset should generate valid identification code" do
    asset = create(:plated_asset)
    assert_equal "OCP_activo_#{asset.id}", asset.identification_code.code
    assert_equal 'QR', asset.identification_code.code_type
  end
end
