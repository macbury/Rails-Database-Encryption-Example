module PasswordEncryption
  extend ActiveSupport::Concern

  def password=(new_password)
    cipher = Gibberish::RSA.new(open(Rails.application.config.public_key_path).read)
    write_attribute :password, cipher.encrypt(new_password)
  end

  def password
    if Rails.application.config.respond_to?(:private_key_path)
      cipher = Gibberish::RSA.new(open(Rails.application.config.private_key_path).read)
      cipher.decrypt(read_attribute(:password))
    else
      read_attribute(:password)
    end
  end
end