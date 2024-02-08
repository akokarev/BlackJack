class Card
	SUITS = ['♣', '♠', '♥', '♦']
	VALUES = [2,3,4,5,6,7,8,9,10,"B","D","K","T"]

	attr_reader :suit, :value
	def initialize(suit, value)
		@suit = suit
		@value = value
	end

	def to_s
		return "\033[47;30m#{value}#{suit}\033[0m" if ['♣', '♠'].include?(suit)
		return "\033[47;31m#{value}#{suit}\033[0m" if ['♥', '♦'].include?(suit)
		"#{value}#{suit}"
	end
end
