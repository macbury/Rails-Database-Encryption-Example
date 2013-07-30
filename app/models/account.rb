class Account < ActiveRecord::Base
  include PasswordEncryption
end
