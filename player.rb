require_relative 'user.rb'
require_relative 'card.rb'
class Player < User
  def lets_play(bank)
    cards.clear
    bank.take_money(self, 10)
    2.times { take_card(bank.cards.pop) }
  end

  def turn(bank)
    self.take_card(bank.cards.pop)
  end

end
