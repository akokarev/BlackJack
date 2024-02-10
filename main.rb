require_relative 'user.rb'
require_relative 'card.rb'

print 'Player name: '
bank = User.new('Bank', 0)
players = [
  dealer = User.new('Dealer', 100),
  player1 = User.new(gets.chomp, 100)
]

bank.define_singleton_method(:lets_play) do
  self.cards.clear
  Card::SUITS.each do |suit|
    Card::VALUES.each do |value|
      self.take_card(Card.new(value, suit))
    end
  end
  self.cards.shuffle!
end

players.each do |player|
  player.define_singleton_method(:lets_play) do
    self.cards.clear
    bank.take_money(self, 20)
  end
end


([bank]+players).each { |user| user.lets_play }
2.times { players.each { |player| player.take_card(bank.cards.pop) }}

puts "#{bank}"
puts "#{dealer} * *"
puts "#{player1} #{player1.cards.join(' ')} =#{player1.points}"
