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
end
