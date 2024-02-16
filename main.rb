# frozen_string_literal: true

require_relative 'player'
require_relative 'dealer'
require_relative 'card'
require_relative 'deck'

deck = Deck.new
dealer = Dealer.new(100)
print 'Player name: '
player1 = Player.new(gets.chomp, 100)

loop do
  deck.lets_play(10, dealer, player1)
  puts
  puts 'Ставки сделаны, игра начинается!'

  while true
    puts "\e[H\e[2J"
    puts
    puts "#{dealer} #{dealer.show_cards(false)}"
    puts "#{player1} #{player1.show_cards(true)} =#{player1.points}"
    puts '1 - Пропустить ход'
    puts '2 - Добавить карту' if player1.cards.count == 2
    puts '3 - Открыть карты'

    print '> '
    case choice = gets.chomp.to_i
    when 1
      dealer.turn(deck)
      break if dealer.points > 21
    when 2
      if player1.cards.count == 2
        player1.turn(deck)
        break if player1.points > 21

        dealer.turn(deck)
        break if dealer.points > 21
      else
        puts 'Нельзя добавить карту'
      end
    when 3
      break
    else
      puts 'Введите цифру соответвстующую вашему выбору'
      gets
    end

    break if player1.cards.count == 3
  end

  puts "\e[H\e[2J"
  puts 'Игра окончена, подсчёт очков:'
  puts "#{dealer} #{dealer.show_cards(true)} =#{dealer.points}"
  puts "#{player1} #{player1.show_cards(true)} =#{player1.points}"
  if (dealer.points > 21) && (player1.points > 21)
    deck.win('Перебрали все/Ничья', dealer, player1)
  elsif dealer.points > 21
    deck.win("#{dealer} перебрал, победа #{player1}", player1)
  elsif player1.points > 21
    deck.win("#{player1} перебрал, победа #{dealer}", dealer)
  elsif dealer.points == player1.points
    deck.win('Ничья по очкам', dealer, player1)
  elsif dealer.points > player1.points
    deck.win("#{dealer} выиграл по очкам", dealer)
  else
    deck.win("#{player1} выиграл по очкам", player1)
  end

  break if player1.cash.zero? || dealer.cash.zero?

  puts
  puts "#{player1}, на Вашем счету $#{player1.cash}"

  loop do
    print 'Сыграем ещё? (Y/n) > '
    choice = gets.chomp.upcase
    break if ['Y', 'N', ''].include?(choice)
  end
  break if choice == 'N'
end

puts
puts "По итогам игры на Вашем счету $#{player1.cash}"
puts 'Вы банкрот!' if player1.cash.zero?
puts 'Вам удалось подзаработать!' if player1.cash > dealer.cash
puts 'Поздравляем, Вы обанкротили диллера!' if dealer.cash.zero?
puts 'Все остались при своих.' if player1.cash == dealer.cash
puts 'Повезет в следующий раз.' if player1.cash < dealer.cash
