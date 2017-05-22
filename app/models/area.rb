class Area < ApplicationRecord
  has_many :assets

  has_many :from_areas, class_name: 'Relocation', foreign_key: 'from_area_id'
  has_many :to_areas, class_name: 'Relocation', foreign_key: 'to_area_id'

  validates_presence_of :name, :description

  has_attached_file :photo, 
                    :styles => { thumb: "100x100#" }, 
                    :default_url => 'defaults/area_:style.png'
  validates_attachment_content_type :photo, content_type: /\Aimage/
  validates_attachment_file_name :photo, matches: [/png\z/, /jpe?g\z/]
end
