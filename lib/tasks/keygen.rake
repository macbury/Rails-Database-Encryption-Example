desc "Generate ssh keypairs"

task generate_encryption_key: :environment do
  keypair = Gibberish::RSA.generate_keypair(1024)

  store_key Rails.application.config.public_key_path,  keypair.public_key
  store_key Rails.application.config.private_key_path, keypair.private_key
end

def store_key(path, content)
  file = File.new(path, "w")
  file.write(content)
  file.close
end

