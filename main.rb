require_relative 'user.rb'


print 'Player name: '
player = User.new(gets.chomp, 100)
dealer = User.new('Dealer', 100)

2.times do
	player.take_card
	dealer.take_card	
end