Rails.application.config.middleware.use OmniAuth::Builder do
  provider :steam, ENV['STEAM_WEB_API_KEY']
  provider :openid, :store => OpenID::Store::Filesystem.new('/tmp')
end