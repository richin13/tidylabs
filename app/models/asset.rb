class Asset < ApplicationRecord
  has_one :identification_code
  has_one :warranty

  has_many :relocations
  has_many :loans
  has_many :support_tickets

  belongs_to :area
  belongs_to :asset_category

  scope :plated, -> { where(type: 'PlatedAsset') }
  scope :unplated, -> { where(type: 'UnplatedAsset') }

  validates_presence_of :serial_number, :description, :status

  # Keep in mind that if the array order changes the mapping of 
  # db integer values changes too. Order must be maintained.
  enum status: [:service, :loan, :retired, :maintenance, :unassigned]

  alias_attribute :category, :asset_category

  def types
    { PlatedAsset: 'placa', UnplatedAsset: 'sin placa' }
  end

  def type_to_h
    types.fetch(type.to_sym)
  end
end
