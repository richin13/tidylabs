class Asset < ApplicationRecord
  has_one :identification_code
  has_one :warranty, inverse_of: :asset, required: false, validate: false
  has_one :network_detail, inverse_of: :asset, required: false, validate: false
  has_one :security_detail, inverse_of: :asset, required: false, validate: false
  has_one :technical_detail, inverse_of: :asset, required: false, validate: false

  has_many :relocations
  has_many :loans
  has_many :support_tickets
  has_many :asset_revisions
  has_many :revisions, through: :asset_revisions

  belongs_to :area
  belongs_to :asset_category, optional: true

  scope :plated, -> { where(type: 'PlatedAsset') }
  scope :unplated, -> { where(type: 'UnplatedAsset') }

  enum status: [:service, :loan, :retired, :maintenance, :unassigned]

  alias_attribute :category, :asset_category

  after_create_commit :generate_id_code

  accepts_nested_attributes_for :warranty
  accepts_nested_attributes_for :network_detail
  accepts_nested_attributes_for :security_detail
  accepts_nested_attributes_for :technical_detail

  has_attached_file :photo, styles: {original: '100%', medium: '300x300#', thumb: '100x100>'},
                    url: '/system/assets/:id/:attachment/:style/:hash.:extension',
                    hash_secret: Tydilabs::Application.config.secret_key,
                    default_url: '/system/defaults/asset_:style.png'

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  validates_presence_of :description, :status, :type, message: 'Este campo es requerido'

  validates_inclusion_of :has_warranty, :has_tech_details, :has_network_details,
                         :has_security_details, in: [true, false, nil]

  TYPES = {
      PlatedAsset: 'Con placa',
      UnplatedAsset: 'Sin placa'
  }.freeze

  STATUS = {
      service: 'En servicio',
      loan: 'En préstamo',
      retired: 'Desechado',
      maintenance: 'En mantenimiento',
      unassigned: 'Sin asignar'
  }.freeze

  def self.build_asset
    asset = Asset.new
    asset.build_warranty
    asset.build_technical_detail
    asset.build_security_detail
    asset.build_network_detail
    asset
  end

  def build_details
    unless warranty
      self.build_warranty
    end

    unless technical_detail
      self.build_technical_detail
    end

    unless network_detail
      build_network_detail
    end

    unless security_detail
      build_security_detail
    end
  end

  def has_warranty?
    self[:has_warranty] and self.category.accepts_warranty_details
  end

  def has_warranty!
    if self.category.accepts_warranty_details
      self[:has_warranty] = !self.has_warranty?
      self.save
    end
  end

  def has_tech_details?
    self[:has_tech_details] and self.category.accepts_technical_details
  end

  def has_tech_details!
    if self.category.accepts_technical_details
      self[:has_tech_details] = !self.has_tech_details?
      self.save
    end
  end

  def has_security_details?
    self[:has_security_details] and self.category.accepts_security_details
  end

  def has_security_details!
    if self.category.accepts_security_details
      self[:has_security_details] = !self.has_security_details?
      self.save
    end
  end

  def has_network_details?
    self[:has_network_details] and self.category.accepts_network_details
  end

  def has_network_details!
    if self.category.accepts_network_details
      self[:has_network_details] = !self.has_network_details?
      self.save
    end
  end

  def loaned?
    Loan.where(asset_id: self.id, finished: false).count == 1
  end

  def last_loans(a = 5)
    Loan.where(asset_id: self.id).order(created_at: :desc).last(a)
  end

  def type_to_h
    TYPES.fetch(type.to_sym)
  end

  def status_to_h
    STATUS.fetch(status.to_sym)
  end

  private

  def generate_id_code
    code = "ocp_activo_#{id}"
    id_code = IdentificationCode.create(code: code, code_type: 'QR', asset_id: id)
    update_attribute(:identification_code, id_code)
  end
end
