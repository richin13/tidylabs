class Revision < ApplicationRecord
  has_many :asset_revisions
  has_many :assets, through: :asset_revisions

  validates_presence_of :name
end
