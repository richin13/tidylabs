module AssetsHelper
  def translate_status(status)
    Asset::STATUS.fetch(status.to_sym)
  end
end
