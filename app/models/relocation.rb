class Relocation < ApplicationRecord
  belongs_to :asset
  belongs_to :from_area, class_name: 'Area'
  belongs_to :to_area, class_name: 'Area'

  validates_presence_of :reason
end
