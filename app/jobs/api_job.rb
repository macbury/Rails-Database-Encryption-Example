require "fake_api"

class ApiJob < Struct.new(:account_id)
  def perform
    @account = Account.find(account_id)
    puts "Account: #{@account.name} password: #{@account.password}"
    api = FakeApi.new(@account.name, @account.password)
    puts "Response: \n" + api.getFriends.to_yaml
  end
end