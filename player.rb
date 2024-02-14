require_relative 'user.rb'
require_relative 'card.rb'
class Player < User
  def lets_play(bank)
    cards.clear
    bank.take_money(self, 10)
    2.times { take_card(bank.cards.pop) }
  end

  def show_cards
    "#{name} #{cards.join(' ')} =#{points}"
  end

  def to_s
    show_cards
  end
  
  def turn(bank)
    self.take_card(bank.cards.pop)
  end

end
