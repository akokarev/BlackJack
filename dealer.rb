require_relative 'player.rb'
class Dealer < Player
	def initialize(cash)
		super('Dealer', cash)
	end

	def turn(bank)
		self.take_card(bank.cards.pop) if (self.points < 17) && (self.cards.count == 2)
	end

end
