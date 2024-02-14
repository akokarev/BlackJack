require_relative 'user.rb'
require_relative 'player.rb'
require_relative 'dealer.rb'
require_relative 'card.rb'
require_relative 'bank.rb'

bank = Bank.new
dealer = Dealer.new(100)
print 'Player name: '
player1 = Player.new(gets.chomp, 100)


loop do

  bank.lets_play
  dealer.lets_play(bank)
  player1.lets_play(bank)

  puts
  puts "Ставки сделаны, игра начинается!"
  while true
    puts bank
    puts dealer
    puts player1
    puts '1 - Пропустить ход'
    puts '2 - Добавить карту' if player1.cards.count==2
    puts '3 - Открыть карты'

    print '> '
    case choice = gets.chomp.to_i
    when 1
      dealer.turn(bank)
      break if dealer.points > 21
    when 2
      if player1.cards.count == 2
        player1.take_card(bank.cards.pop)
        break if player1.points > 21
        dealer.turn(bank)
        break if dealer.points > 21
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
    dealer.take_money(bank, bank.cash / 2)
    player1.take_money(bank)
  elsif dealer.points > 21
    puts "#{dealer.name} перебрал"
    player1.take_money(bank)
  elsif player1.points > 21
    puts "#{player1.name} перебрал, победа #{dealer.name}"
    dealer.take_money(bank)
  elsif dealer.points == player1.points
    puts "Ничья по очкам"
    dealer.take_money(bank, bank.cash / 2)
    player1.take_money(bank)
  elsif dealer.points > player1.points
    puts "#{dealer.name} выиграл по очкам"
    dealer.take_money(bank)
  else
    puts "#{player1.name} выиграл по очкам"
    player1.take_money(bank)
  end

  break if (player1.cash == 0) || (dealer.cash == 0)
  
  puts
  puts "#{player1.name}, на Вашем счету $#{player1.cash}"

  loop do
  	print 'Сыграем ещё? (Y/n) > '
  	choice = gets.chomp.upcase
  	break if ['Y','N',''].include?(choice)
  end
  break if choice == 'N'
end

puts "По итогам игры на Вашем счету $#{player1.cash}"
puts "Вы банкрот!" if player1.cash == 0
puts "Вам удалось подзаработать!" if player1.cash > dealer.cash
puts "Поздравляем, Вы обанкротили диллера!" if dealer.cash == 0
puts "Все остались при своих." if player1.cash ==  dealer.cash
puts "Повезет в следующий раз." if player1.cash < dealer.cash
