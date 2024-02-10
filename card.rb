class Card
	VALUES = [2,3,4,5,6,7,8,9,10,"B","D","K","T"]
	SUITS = ['♣', '♠', '♥', '♦']

	attr_reader :value, :suit
	def initialize(value, suit)
		@value = value
		@suit = suit
	end

	def to_s
		return "\033[47;30m#{value}#{suit} \033[0m" if ['♣', '♠'].include?(suit)
		return "\033[47;31m#{value}#{suit} \033[0m" if ['♥', '♦'].include?(suit)
		"#{value}#{suit}"
	end
end
