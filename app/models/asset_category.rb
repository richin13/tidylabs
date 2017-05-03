class AssetCategory < ApplicationRecord
  has_many :assets

  validates_presence_of :name, :description
end
