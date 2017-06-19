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
    assert_equal "ocp_activo_#{asset.id}", asset.identification_code.code
    assert_equal 'QR', asset.identification_code.code_type
  end

  test 'should delegate has_ methods to its simple category' do
    asset = create(:asset_without_details)

    # explicitly set has_ attrs to true
    asset.has_warranty = true
    asset.has_tech_details = true
    asset.has_security_details = true
    asset.has_network_details = true

    assert_not asset.has_warranty?
    assert_not asset.has_tech_details?
    assert_not asset.has_network_details?
    assert_not asset.has_security_details?
  end

  test 'should delegate has_ methods to its complex category' do
    asset = create(:asset_with_details)

    # explicitly set has_ attrs to false
    asset.has_warranty = false
    asset.has_tech_details = false
    asset.has_security_details = false
    asset.has_network_details = false

    # Should resolve false because we set the has_ attrs to false,
    # even though the category still accepts those attrs,
    # the asset appears not to have any ;)
    assert_not asset.has_warranty?
    assert_not asset.has_tech_details?
    assert_not asset.has_network_details?
    assert_not asset.has_security_details?
  end
end
