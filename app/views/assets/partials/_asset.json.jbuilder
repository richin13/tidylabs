json.(asset, :id, :serial_number, :description, :plate_number, :quantity, :status)
json.type asset.type_to_h
json.photo_url asset.photo.url(:thumb)

json.area do
  json.partial! 'assets/partials/area', area: asset.area
end

json.category do
  json.partial! 'assets/partials/category', category: asset.category
end

if asset.has_warranty?
  json.partial! 'assets/partials/warranty_details', warranty: asset.warranty
end

if asset.has_tech_details?
  json.partial! 'assets/partials/technical_details', technical_detail: asset.technical_detail
end

if asset.has_security_details?
  json.partial! 'assets/partials/security_details', security_detail: asset.security_detail
end

if asset.has_network_details?
  json.partial! 'assets/partials/network_details', network_detail: asset.network_detail
end
