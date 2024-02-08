class User
  attr_reader :name, :cards
  attr_accessor :bank

  def initialize(name, bank)
    @name = name
    @bank = bank
    @cards = []
  end

  def take_card
  end
  
end
