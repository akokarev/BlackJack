class User
  attr_reader :name
  attr_accessor :cash, :cards

  def initialize(name, cash)
    @name = name
    @cash = cash
    @cards = []
  end

  def take_card(card)
    cards << card
  end

  def take_money(from, count = nil)
    count = from.cash if count.nil?
    raise "Не хватает денег у #{from.name}" if from.cash < count
    from.cash = from.cash - count
    @cash += count
  end

  def points
    21
  end

  def to_s
    "#{name} ($#{cash})}"
  end
end
