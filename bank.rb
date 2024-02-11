require_relative 'user.rb'
require_relative 'card.rb'
class Bank < User
  def initialize
  	super('Bank', 0)
  end

  def lets_play
    cards.clear
    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        take_card(Card.new(value, suit))
      end
    end
    cards.shuffle!
  end

  def to_s
  	"#{name} ($#{cash})"
  end
end
