json.security_details do
  json.username security_detail.username
  json.password AESCrypt.encrypt(security_detail.password, Tydilabs::Application.config.secret_key)
end
