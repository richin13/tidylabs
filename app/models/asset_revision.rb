class AssetRevision < ApplicationRecord
  belongs_to :asset
  belongs_to :revision
end
