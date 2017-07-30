require_relative 'deck'

class Player

  attr_reader :cards

  def initialize(name)
    @name    = name
    @account = 100
    @pack_of_cards = Deck.new
    @cards = []
  end


  # def get_cards
  #   2.times do
  #     @cards << @pack_of_cards.deck.delete_at(rand(@pack_of_cards.deck.length))
  #   end
  # end
end


player = Player.new('Jimmy')

player.take_cards
puts player.cards