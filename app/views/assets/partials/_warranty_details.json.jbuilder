json.warranty_details do
  json.purchase_date warranty.purchase_date
  json.months warranty.month_period
  json.agent_name warranty.agent_name
  json.agent_phone warranty.agent_phone
  json.duration time_ago_in_words warranty.purchase_date
end