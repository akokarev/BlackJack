require_relative 'user.rb'
require_relative 'card.rb'

print 'Player name: '
player = User.new(gets.chomp, 100)
dealer = User.new('Dealer', 100)
bank = User.new('Bank', 0)


player.cards.clear
bank.take_money(player, 20)

dealer.cards.clear
bank.take_money(dealer, 20)

bank.cards.clear
Card::SUITS.each do |suit|
	Card::VALUES.each do |value|
		bank.take_card(Card.new(value, suit))
	end
end
bank.cards.shuffle!


2.times do
	player.take_card(bank.cards.pop)
	dealer.take_card(bank.cards.pop)
end

puts "#{bank}"
puts "#{dealer} * *"
puts "#{player} #{player.cards.join(' ')} =#{player.points}"
