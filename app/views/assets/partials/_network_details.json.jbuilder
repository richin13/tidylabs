json.network_details do
  json.ip network_detail.ip
  json.mask network_detail.mask
  json.gateway network_detail.dns
  json.dns network_detail.dns
end