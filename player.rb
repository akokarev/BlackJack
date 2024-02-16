# frozen_string_literal: true

class Player
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

  def points
    values = cards.map do |card|
      if card.value.is_a?(String)
        card.value == 'T' ? 1 : 10
      else
        card.value
      end
    end
    if (t_pos = values.index(1)) && (values.sum <= 11)
      values[t_pos] = 11
    end
    values.sum
  end

  def show_cards(open = false)
    if open
      cards.join(' ').to_s
    else
      cards.map { "\033[47;34m * \033[0m" }.join(' ').to_s
    end
  end

  def to_s
    name.to_s
  end

  def turn(deck)
    take_card(deck.cards.pop)
  end
end
