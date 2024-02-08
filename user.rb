class User
  attr_reader :name
  attr_accessor :cash, :cards

  def initialize(name, cash)
    @name = name
    @cash = cash
    @cards = []  #TODO возможно не нужно
  end

  def take_card(deck)
    cards << deck.pop
  end

  def take_money(from, count = nil)
    count = from.cash if count.nil?
    raise "Не хватает денег у #{from.name}" if from.cash < count
    from.cash = from.cash - count
    @cash += count
  end

  def to_s
    "#{name} ($#{cash}) #{cards.map ' '}"
  end
end
