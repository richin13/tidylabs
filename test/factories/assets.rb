FactoryGirl.define do
  factory :plated_asset, class: PlatedAsset do
    serial_number "888888"
    description "Test asset"
    plate_number "123456"
    status 0
    association :area, factory: :area 
  end

  factory :unplated_asset, class: UnplatedAsset do
    serial_number "888888"
    description "Test asset"
    quantity 10
    status 0
    association :area, factory: :area 
  end

  factory :asset_without_details, class: UnplatedAsset do
    description 'A simple asset'
    quantity 5
    status 0
    association :area, factory: :area
    association :category, factory: :category_without_details
  end

  factory :asset_with_details, class: PlatedAsset do
    description 'A complex asset'
    plate_number '330789'
    status 0
    has_warranty true
    has_tech_details true
    has_security_details true
    has_network_details true
  end
end
