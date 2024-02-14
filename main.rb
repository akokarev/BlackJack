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

puts "Ставки сделаны, игра начинается!"
while true
  puts bank
  puts dealer
  puts player1
  puts '1 - Пропустить ход'
  puts '2 - Добавить карту' if player1.cards.count==2
  puts '3 - Открыть карты'

  case choice = gets.chomp.to_i
  when 1
  	dealer.take_card(bank.cards.pop) if (dealer.points < 17) && (dealer.cards.count == 2)
    break if dealer.points > 21
  when 2
  	if player1.cards.count == 2
  		player1.take_card(bank.cards.pop)
      break if player1.points > 21
  	else
  		puts 'Нельзя добавить карту'
  	end
  when 3
    break  	
  else
  	puts 'Введите цифру соответвстующую вашему выбору'
  end

  break if player1.cards.count == 3
end

puts "Игра окончена, подсчёт очков:"
puts dealer.show_cards
puts player1.show_cards
if (dealer.points > 21) && (player1.points > 21)
  puts "Перебрали все/Ничья"
end

