require_relative 'deck'
require_relative 'card'

class Player
  attr_accessor :cards

  def initialize(name)
    @name          = name
    @account       = 100
    @pack_of_cards = Deck.new
    @cards         = {}
  end

  def take_cards
    2.times do
      @cards[@pack_of_cards.deck[0]] = @pack_of_cards.deck[0].value
      @pack_of_cards.deck.delete_at(0)
    end
  end

  def sum_of_cards
    @sum = @cards.values.inject(:+)
    @sum -= 10 if @sum > 21 && @cards.value?(11)
    @sum
  end
end


player = Player.new('Jimmy')
player.take_cards
puts player.sum_of_cards