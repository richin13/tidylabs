class AssetRevision < ApplicationRecord
  belongs_to :asset
  belongs_to :revision

  validates_presence_of :asset, :revision
  validates :asset_id, :uniqueness => { :scope => :revision_id }
end
