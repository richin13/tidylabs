FactoryGirl.define do
  factory :asset_revision do
    association :asset, factory: :plated_asset
    association :revision, factory: :revision
  end
end
