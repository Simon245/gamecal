STEAM_CONFIG = YAML.load_file("#{::Rails.root}/config/steam.yml")[::Rails.env]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :steam, STEAM_CONFIG['steam_api']
end