class Warranty < ApplicationRecord
  belongs_to :asset

  validates_presence_of :purchase_date, :month_period, :agent_name, :agent_phone
end
