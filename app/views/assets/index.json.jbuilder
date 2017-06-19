json.array! @assets do |asset|
  json.partial! 'assets/partials/asset', asset: asset
end