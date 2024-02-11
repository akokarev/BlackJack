require_relative 'player.rb'
class Dealer < Player
	def initialize(cash)
		super('Dealer', cash)
	end

	def to_s
		"#{name} ($#{cash}) #{cards.map{"\033[47;34m * \033[0m"}.join(' ')}"
	end
end
