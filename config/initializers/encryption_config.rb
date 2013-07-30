Rails.application.config.public_key_path  = Rails.root.join("config/encryption.pub")

if ENV['IS_DELAYED_JOB']
  Rails.application.config.private_key_path = Rails.root.join("config/encryption.priv")
end