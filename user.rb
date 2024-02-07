class User
  attr_reader :name
  attr_accessor :bank
  
  def initialize(name, bank)
    @name = name
    @bank = bank
  end
end
