# frozen_string_literal: true

require_relative 'player'
class Dealer < Player
  def initialize(cash)
    super('Dealer', cash)
  end

  def turn(bank)
    take_card(bank.cards.pop) if (points < 17) && (cards.count == 2)
  end
end
