class Area < ApplicationRecord
  has_many :assets

  has_many :from_areas, class_name: 'Relocation', foreign_key: 'from_area_id'
  has_many :to_areas, class_name: 'Relocation', foreign_key: 'to_area_id'

  validates_presence_of :name, :description
end
