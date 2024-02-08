class Card
	SUITS = ["\0330;30♣\033", "\0330;0♠\033", "\0330;31♥\033", "\0330;31♦\033"]
	CARDS = [2,3,4,5,6,7,8,9,10,"B","D","K","T"]

	attr_reader :suit, :value
	def initialize(suit, value)
		@suit = suit
		@value - value
	end
end
