class Card

  attr_reader :rank, :suit, :value

  def initialize(rank, suit)
    @rank  = rank
    @suit  = suit
    @value = @rank.to_i.zero? ? 10 : rank.to_i
  end

  def card_info
    puts "#{rank}, #{suit}, #{value}"
  end
end