Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FACEBOOK_CONFIG['app_id'], FACEBOOK_CONFIG['secret'], {:scope => 'public_profile,email'}
end

OmniAuth.config.on_failure = Proc.new do |env|
  SessionsController.action(:auth_failure).call(env)
end