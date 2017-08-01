require_relative 'card'

class Deck

  attr_reader :deck

  def initialize
    @ranks = %w(6 7 8 9 10 J Q K A)
    @suits = %w(Spades Hearts Diamonds Clubs)
    @deck = []

    @suits.each do |suit|
      @ranks.size.times do |i|
        @deck << Card.new(@ranks[i], suit)
      end
    end
    @deck.shuffle!
  end
end

# pack_of_cards = Deck.new
#
# puts pack_of_cards.deck[0].value