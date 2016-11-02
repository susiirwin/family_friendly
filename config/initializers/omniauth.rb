Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "TWIITER_API_KEY", "TWIITER_API_SECRET"
end
