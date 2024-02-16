# frozen_string_literal: true

require_relative 'player'
require_relative 'card'
class Deck
  attr_accessor :cash, :cards

  def initialize
    @cards = []
    @cash = 0
  end

  def lets_play(bet, *players)
    cards.clear
    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        cards << Card.new(value, suit)
      end
    end
    cards.shuffle!

    players.each do |player|
      player.cards.clear
      player.cash -= bet
      raise "Не хватает денег у #{player}" if player.cash.negative?

      self.cash += bet
      2.times { player.take_card(cards.pop) }
    end
  end

  def win(message, *players)
    puts message if message != ''
    players.each do |player|
      player.cash += self.cash / players.count
    end
    self.cash = 0
  end
end
