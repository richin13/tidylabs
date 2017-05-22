class IdentificationCode < ApplicationRecord
  belongs_to :asset

  validates_presence_of :code, :type
end
