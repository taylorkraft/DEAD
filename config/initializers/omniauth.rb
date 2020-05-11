Rails.application.config.middleware.use OmniAuth::Builder do
<<<<<<< HEAD
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"],ENV["GOOGLE_CLIENT_SECRET"]
=======
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"],ENV["GOOGLE_CLIENT_SECRET"], skip_jwt: true
>>>>>>> updated_master
end