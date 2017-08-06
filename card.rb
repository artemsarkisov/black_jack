class Card
  attr_reader :rank, :suit, :value

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
