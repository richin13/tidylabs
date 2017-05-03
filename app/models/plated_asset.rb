class PlatedAsset < Asset
  has_one :network_detail
  has_one :security_detail
  has_one :technical_detail

  validates_presence_of :plate_number
end
