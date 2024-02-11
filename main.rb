require_relative 'user.rb'
require_relative 'player.rb'
require_relative 'dealer.rb'
require_relative 'card.rb'
require_relative 'bank.rb'

bank = Bank.new
dealer = Dealer.new(100)
print 'Player name: '
player1 = Player.new(gets.chomp, 100)

bank.lets_play
dealer.lets_play(bank)
player1.lets_play(bank)

puts bank
puts dealer
puts player1
puts '1 - Пропустить ход'
puts '2 - Добавить карту' if player1.cards.count==2
puts '3 - Открыть карты'

case gets.chomp.to_i
when 1
	dealer.take_card(bank.cards.pop) if (dealer.points < 17) && (dealer.cards.count == 2)
when 2
	if player1.cards.count == 2
		player1.take_card(bank.cards.pop)
	else
		puts 'Нельзя добавить карту'
	end
when 3
	
else
	puts 'Введите цифру соответвстующую вашему выбору'
end