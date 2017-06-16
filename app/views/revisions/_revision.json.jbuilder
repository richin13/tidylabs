json.extract! revision, :id, :name, :description, :open, :created_at, :updated_at
json.url      revision_url(revision, format: :json)

json.assets revision.asset_revisions do |rev|
  asset = rev.asset
  json.id            asset.id
  json.serial_number asset.serial_number
  json.plate_number  asset.plate_number
  json.quantity      asset.quantity

  json.type          asset.type
  json.type_readable asset.type_to_h
  json.url           asset_url(asset, format: :json)
end
