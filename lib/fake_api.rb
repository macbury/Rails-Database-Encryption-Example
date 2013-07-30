class FakeApi

  def initialize(name, password)
    @password = password  
    @name     = name
  end

  def getFriends
    sleep 1 + (rand * 3).round
    10.times.inject([]) do |output|
      output << {
        id: 1+(rand * 9999).round,
        name:  Faker::Name.name,
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.cell_phone
      }
    end
  end

end