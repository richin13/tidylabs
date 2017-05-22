class SupportTicket < ApplicationRecord
  belongs_to :asset

  enum status: [:pending, :resolved, :ignored]
end
