Rails.application.config.middleware.use OmniAuth::Builder do
  provider :steam, "9006A23029A4FD05FB8E43D7467183E8"
end