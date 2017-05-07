class Asset < ApplicationRecord
  has_one :identification_code
  has_one :warranty, inverse_of: :asset, required: false, validate: false
  has_one :network_detail, inverse_of: :asset, required: false, validate: false
  has_one :security_detail, inverse_of: :asset, required: false, validate: false
  has_one :technical_detail, inverse_of: :asset, required: false, validate: false

  has_many :relocations
  has_many :loans
  has_many :support_tickets

  belongs_to :area
  belongs_to :asset_category, optional: true

  scope :plated, -> { where(type: 'PlatedAsset') }
  scope :unplated, -> { where(type: 'UnplatedAsset') }

  enum status: [:service, :loan, :retired, :maintenance, :unassigned]

  accepts_nested_attributes_for :warranty
  accepts_nested_attributes_for :network_detail
  accepts_nested_attributes_for :security_detail
  accepts_nested_attributes_for :technical_detail

  has_attached_file :photo, styles: {medium: '300x300>', thumb: '100x100>'},
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  # Validations
  validates :serial_number, presence: {message: 'Este campo es requerido'},
            uniqueness: {message: 'Ya existe un activo con esa serie'}
  validates_presence_of :description, :status, :type, message: 'Este campo es requerido'
  validates_inclusion_of :has_warranty, :has_tech_details, :has_network_details,
                         :has_security_details, in: [true, false]
  validates_associated :warranty, if: :has_warranty?
  validates_associated :technical_detail, if: :has_tech_details?
  validates_associated :security_detail, if: :has_security_details?
  validates_associated :network_detail, if: :has_network_details?

  TYPES = {
      :PlatedAsset => 'Con placa',
      :UnplatedAsset => 'Sin placa'
  }

  STATUS = {
      :service => 'En servicio',
      :loan => 'En préstamo',
      :retired => 'Desechado',
      :maintenance => 'En mantenimiento',
      :unassigned => 'Sin asignar'
  }

  def self.build_asset
    asset = Asset.new
    asset.build_warranty
    asset.build_technical_detail
    asset.build_security_detail
    asset.build_network_detail
    asset
  end

  def has_warranty?
    self[:has_warranty]
  end

  def has_tech_details?
    self[:has_tech_details]
  end

  def has_security_details?
    self[:has_security_details]
  end

  def has_network_details?
    self[:has_network_details]
  end

end
