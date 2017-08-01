class Card
  attr_accessor :rank, :suit, :value

  def initialize(rank, suit)
    @rank  = rank
    @suit  = suit
    @value = if @rank == 'A'
               11
             elsif @rank == 'Q' || @rank == 'K' || @rank == 'J'
               10
             else
               @rank.to_i
             end
  end

  def card_info
    puts "#{rank}, #{suit}, #{value}"
  end
end

# card = Card.new('Q', 'Spades')
# puts card.card_info
