require_relative 'dealer'
require_relative 'player'
require_relative 'deck'

class Interface

  def initialize
    puts "Enter your name"
    name           = gets.chomp
    @player        = Player.new(name)
    @dealer        = Dealer.new
    @pack_of_cards = Deck.new
  end

  def take_cards
    2.times do
      @player.cards << @pack_of_cards.deck.delete_at(rand(@pack_of_cards.deck.length))
      @dealer.cards << @pack_of_cards.deck.delete_at(rand(@pack_of_cards.deck.length))
    end
    @player.account -= 10
    @dealer.account -= 10
  end
end
